<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"
      ><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive"
    /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript">
   <!--
  	function carouselParam() {
  		$('#slideshow<?php echo $module; ?>').owlCarousel({
  		items: 5,
  		autoPlay: 5000,
  		singleItem: true,
  		navigation: true,
  		navigationText: ['<i class="fa fa-light fa-angle-left"></i>', '<i class="fa fa-light fa-angle-right"></i>'],
  		pagination: false,
  		stopOnHover: true,
  	slideSpeed: 1000,
  	paginationSpeed: 1000,
  	rewindSpeed: 1000,
  	loop: true
  	});
  	}

  carouselParam();
  const carousel = document.querySelector("#slideshow0");
  	carousel.addEventListener('touchstart', carouselParam, { passive: false });
   -->
</script>
