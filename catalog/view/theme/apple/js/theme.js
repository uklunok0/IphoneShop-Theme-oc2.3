window.addEventListener("DOMContentLoaded", () => {
  // кнопка купить в один клик

  const product = document.querySelectorAll(".product-thumb");

  // добавить кнопку "купить в один клик"
  product.forEach((element, index) => {
    let temp = "pp-item-" + index;
    const buttonGroup = element.querySelector(".button-group"),
      firstButton = buttonGroup.querySelector("button"),
      oneClickBtn = document.createElement("a");

    oneClickBtn.classList.add("button");
    oneClickBtn.classList.add("toClick");
    oneClickBtn.href = "#" + temp;
    oneClickBtn.textContent = "Купить в один клик";
    firstButton.insertAdjacentElement("afterend", oneClickBtn);
    // получить картинку, цены
    const getImg = element.querySelector(".image .img-responsive"),
      getImgUrl = getImg.getAttribute("src"),
      getItem = element.querySelector(".caption h4 a"),
      getItemName = getItem.textContent,
      getPrice = element.querySelector(".caption .price"),
      getItemPrice = getPrice.textContent,
      priceParts = getItemPrice.split("Без НДС:"),
      getPriceWithoutTax = priceParts[0],
      getPriceNew = getPrice.querySelector(".price-new"),
      getEmail = document.querySelector(".ajax-form [name=admin_email]").value;
    let priceDiscount = 0;
    if (getPriceNew) {
      priceDiscount = getPriceNew.textContent;
    }
    // вёрстка модального окна - купить в один клик
    element.insertAdjacentHTML(
      "afterend",
      `<div id="${temp}" class="product-popup " style="display:none">\
			<h2>Купить в один клик</h2>\
			<div class="pp-img-wrap"><img src="${getImgUrl}" alt="Айфонсервис"></div>\
			<div class="pp-content">\
			<h3>${getItemName}</h3>\ 
			<p>${priceDiscount || getPriceWithoutTax}</p>\
			<form class="ajax-form">\
			<input type="hidden" name="project_name" value="IphoneService">\
      <input type="hidden" name="admin_email" value="${getEmail}">\
      <input type="hidden" name="form_subject" value="Заявка с сайта Айфонсервис" />\
			<input type="hidden" name="product" value="${getItemName}">\
			<input class="form-control" type="text" name="phone" placeholder="Введите Ваш телефон..." required autocomplete="tel">\
			<button class="btn btn-primary">Заказать</button>\
			</form>\
			<div class="success">Спасибо за заявку</div>\
			</div>\
      </div>`
    );
  });

  // плагин модальногь окна для заказать в один клик
  $(".toClick").magnificPopup({
    mainClass: "mfp-zoom-in",
    removalDelay: 500,
  });

  // заблокировать модалку
  const popupModalOneClick = document.querySelectorAll(".product-layout .button-group>:nth-child(2)");
  popupModalOneClick.forEach((element) => {
    if (element) {
      element.addEventListener("click", () => {
        console.log(element);
        document.querySelector(".product-popup").style.display = "block";
      });
    }
  });

  // изменить бутстрап сетку
  const productLayout = document.querySelectorAll(".product-layout");

  productLayout.forEach((element) => {
    element.className = "product-layout col-lg-4 col-md-4 col-sm-6 col-xs-12";
  });

  // выравнять высоту карточек по самой высокой
  const equalHeights = document.querySelectorAll(".caption h4");
  let maxHeight = 0;
  equalHeights.forEach((element) => {
    maxHeight = Math.max(maxHeight, element.offsetHeight);
  });

  equalHeights.forEach((element) => {
    element.style.height = maxHeight + "px";
  });

  // плагин модальногь окна для заказать звонок
  $(".callback").magnificPopup({
    mainClass: "mfp-zoom-in",
    removalDelay: 500,
  });
  // заблокировать модалку
  const popupModalCallback = document.querySelector(".footer-phone .site-phone_wrap .callback");
  if (popupModalCallback) {
    popupModalCallback.addEventListener("click", () => {
      document.querySelector(".product-popup").style.display = "block";
    });
  }

  //E-mail Ajax Send
  $(".ajax-form").submit(function () {
    //Change
    var th = $(this);
    $.ajax({
      type: "POST",
      url: "/catalog/view/theme/apple/mail.php", //Change
      data: th.serialize(),
    }).done(function () {
      var modalSuccess = th.closest(".product-popup").find(".success");
      modalSuccess.fadeIn();
      setTimeout(function () {
        th.trigger("reset");
        modalSuccess.fadeOut();
        $.magnificPopup.close();
      }, 2000);
    });
    return false;
  });

  // добавить список товаров в navbar мобильной версии
  const parentEl = document.querySelector(".navbar-nav-cat");
  // Получаем все элементы <a> внутри контейнера с классом 'list-group'
  const products = document.querySelectorAll(".list-group a");

  // Преобразуем NodeList в массив и используем forEach
  Array.from(products).forEach((item) => {
    // Клонируем элемент, чтобы избежать изменения оригинального элемента
    const clonedItem = item.cloneNode(true);
    clonedItem.classList.remove("list-group-item");

    parentEl.insertAdjacentHTML(
      "beforeend",
      `<li>${clonedItem.outerHTML}</li>
		`
    );
  });
});
