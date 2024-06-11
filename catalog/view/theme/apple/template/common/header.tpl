<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
  <!--<![endif]-->
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title><?php echo $title; ?></title>
    <!-- Open Graph мета-теги -->
    <meta property="og:title" content="Купить технику Apple" />
    <meta property="og:description" content="Здесь Вы можете приобрести продукцию фирмы Apple: смартфоны и наручные часы" />
    <meta itemprop="image" content="https://iphoneservice.na4u.ru/image/preview.png" />
    <meta property="og:image" content="https://iphoneservice.na4u.ru/image/preview.png" />
    <meta property="og:image:width" content="1200" />
    <meta property="og:image:height" content="630" />
    <meta property="aiturec:image" content="https://iphoneservice.na4u.ru/image/preview.png" />
    <meta name="twitter:image" content="https://iphoneservice.na4u.ru/image/preview.png" />
    <meta property="og:url" content="https://iphoneservice.na4u.ru/index.php?route=common/home" />
    <meta property="og:type" content="website" />
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <link rel="stylesheet" href="/catalog/view/javascript/jquery/magnific/magnific-popup.css" />
    <link href="catalog/view/theme/apple/stylesheet/stylesheet.css" rel="stylesheet" />
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>

    <script src="/catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js"></script>
    <script src="/catalog/view/theme/apple/js/theme.js"></script>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
  </head>
  <body class="<?php echo $class; ?>">
    <header>
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-3">
            <div id="logo" class="logo">
              <?php if ($logo) { ?>
              <a href="<?php echo $home; ?>"
                ><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"
              /></a>
              <?php } else { ?>
              <h1>
                <a href="<?php echo $home; ?>"><?php echo $name; ?></a>
              </h1>
              <?php } ?>
            </div>
          </div>
          <div class="col-md-6 col-sm-5"><?php echo $search; ?></div>
          <ul class="col-md-3 col-sm-4">
            <li class="dropdown">
              <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-user"></i>
                <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span>
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <?php if ($logged) { ?>
                <li>
                  <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                </li>
                <li>
                  <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
                </li>
                <li>
                  <a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>
                </li>
                <li>
                  <a href="<?php echo $download; ?>"><?php echo $text_download; ?></a>
                </li>
                <li>
                  <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
                </li>
                <?php } else { ?>
                <li>
                  <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
                </li>
                <li>
                  <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
                </li>
                <?php } ?>
              </ul>
            </li>

            <li class="header-phone">
              <?php echo $telephone; ?>
            </li>
          </ul>
        </div>
      </div>
    </header>
    <nav id="top" class="top-menu">
      <div class="container">
        <div class="row">
          <div class="col-sm-9">
            <nav id="menu" class="navbar">
              <div class="navbar-header">
                <span class="toggle-text hidden-lg hidden-md hidden-sm" id="category"><?php echo $text_information; ?>:</span>
                <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                  <i class="fa fa-bars"></i>
                </button>
              </div>
              <div class="collapse navbar-collapse navbar-ex1-collapse">
                <!-- <ul class="nav navbar-nav"> -->
                <?php if ($informations) { ?>
                <ul class="nav navbar-nav">
                  <?php foreach ($informations as $information) { ?>
                  <li>
                    <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
                  </li>
                  <?php } ?>
                  <li><a href="/skidki">Скидки</a></li>
                  <li><a href="<?php echo $contact; ?>">Контакты</a></li>
                  <!-- </ul> -->

                  <?php } ?>
                </ul>
              </div>
            </nav>
          </div>
          <div class="col-sm-3 cart-wrapper">
            <?php echo $cart; ?>
          </div>
          <div class="col-sm-9 hidden-lg hidden-md hidden-sm">
            <nav id="categories" class="navbar">
              <div class="navbar-header">
                <span class="toggle-text hidden-lg hidden-md hidden-sm" id="category">Товары:</span>
                <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse-cat">
                  <i class="fa fa-bars"></i>
                </button>
              </div>
              <div class="collapse navbar-collapse navbar-ex1-collapse-cat">
                <ul class="nav navbar-nav navbar-nav-cat"></ul>
              </div>
            </nav>
          </div>
        </div>
      </div>
    </nav>
  </body>
</html>
