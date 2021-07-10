<template>
  <div>
    <section class="portfolio section" id="portfolio">
      <h2 class="section__title">{{$t('Portfolio')}}</h2>
      <span class="section__subtitle">{{$t('portofolio.subtitle')}}</span>

      <div class="portfolio__container container swiper-container">
        <div class="swiper-wrapper">
          <!--=============== PORTFOLIO 1 ===============-->
          <div class="portfolio__content grid swiper-slide">
            <img src="@/assets/img/portfolio1.jpg" alt="" class="portfolio__img" />

            <div class="portfolio__data">
              <h3 class="portfolio__title">{{ $t('portofolio.title1')}}</h3>
              <p class="portfolio__description">{{ $t('portofolio.description1')}}</p>
              <a href="https://roomies.blackvolta.tech" target="_blank" class="button button--flex button--small portfolio__button">
                {{ $t('demo')}}
                <i class="uil uil-arrow-right button__icon"></i>
              </a>
            </div>
          </div>

          <!--=============== PORTFOLIO 2 ===============-->
          <div class="portfolio__content grid swiper-slide">
            <img src="@/assets/img/portfolio2.jpg" alt="" class="portfolio__img" />

            <div class="portfolio__data">
              <h3 class="portfolio__title">{{ $t('portofolio.title2')}}</h3>
              <p class="portfolio__description">{{ $t('portofolio.description2')}}</p>
            </div>
          </div>
        </div>

        <div class="swiper-button-next">
          <i class="uil uil-angle-right-b swiper-portfolio-icon"></i>
        </div>
        <div class="swiper-button-prev">
          <i class="uil uil-angle-left-b swiper-portfolio-icon"></i>
        </div>

        <div class="swiper-pagination"></div>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import Swiper from "@/assets/js/swiper-bundle.min.js";

@Component
export default class portofolio extends Vue {
  private mounted() {
    new Swiper(".portfolio__container", {
      cssMode: true,
      loop: true,

      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
  }
}
</script>