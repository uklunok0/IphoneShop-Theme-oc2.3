import pkg from "gulp";
const { src, dest, parallel, series, watch } = pkg;

import browserSync from "browser-sync";
import gulpSass from "gulp-sass";
import * as dartSass from "sass";
const sassModule = gulpSass(dartSass);
import postCss from "gulp-postcss";
import cssnano from "cssnano";
import autoprefixer from "autoprefixer";
import ftp from "vinyl-ftp";
import fancyLog from "fancy-log";
import dotenv from "dotenv";

dotenv.config();

// Обновление страниц сайта на локальном сервере

function browsersync() {
  browserSync.init({
    proxy: "opencart.loc",
    ghostMode: { clicks: false },
    notify: false,
    online: true,
  });
}

// Компиляция stylesheet.css

function sass() {
  return src(["catalog/view/theme/apple/stylesheet/stylesheet.sass"])
    .pipe(
      sassModule({
        "include css": true,
        includePaths: ["catalog/view/theme/apple/libs/bourbon/core"],
      })
    )
    .on("error", sassModule.logError)
    .pipe(
      postCss([
        autoprefixer({ grid: "autoplace" }),
        cssnano({
          preset: ["default", { discardComments: { removeAll: true } }],
        }),
      ])
    )
    .pipe(dest("catalog/view/theme/apple/stylesheet/"))
    .pipe(browserSync.stream());
}

// Выгрузка изменений на хостинг

function deploy() {
  var conn = ftp.create({
    host: process.env.FTP_HOST,
    user: process.env.FTP_USER,
    password: process.env.FTP_PASSWORD,
    parallel: 10,
    log: fancyLog,
  });

  var globs = [
    "catalog/view/theme/apple/**",
    "!catalog/view/theme/apple/libs/**", // Исключить libs папку
  ];
  return src(globs, { buffer: false }).pipe(conn.dest("/www/catalog/view/theme/apple/"));
}

// Наблюдение за файлами

function startwatch() {
  watch(["catalog/view/theme/apple/stylesheet/stylesheet.sass"], { usePolling: true }, sass);
  watch(
    [
      "catalog/view/theme/apple/template/**/*.tpl",
      "catalog/view/theme/apple/js/**/*.js",
      "catalog/view/theme/apple/libs/**/*",
      "catalog/view/theme/apple/js/**/*.js",
    ],
    { usePolling: true }
  ).on("change", browserSync.reload);
}

export { sass, deploy };
export default series(sass, parallel(browsersync, startwatch));
