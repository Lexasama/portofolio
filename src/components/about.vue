<template>
  <div>
    <section class="about section" id="about">
      <h2 class="section__title">{{ $t("about.about-me") }}</h2>
      <span class="section__subtitle">{{ $t("about.my-introduction") }}</span>

      <div class="about__container container grid">
        <img src="@/assets/img/about.jpg" alt="" class="about__img" />

        <div class="about__data">
          <p class="about__description" v-html="$t('about.description')"> </p>

          <div class="about__info">
            <div>
              <span class="about__info-title">03+</span>
              <span class="about__info-name"
                >{{ $t("years") }} <br />
                {{ $t("experience.min") }}</span
              >
            </div>

            <div>
              <span class="about__info-title">20+</span>
              <span class="about__info-name">{{ $t("projects.min") }}</span>
            </div>

            <div>
              <span class="about__info-title">01+</span>
              <span class="about__info-name"
                >{{ $t("year") }} <br />
                {{ $t("work.experience") }}</span
              >
            </div>
          </div>

          <div class="about__buttons">
            <!--==================== CV ====================-->
            <a download="" :href="`${path}axel-cv.pdf`" class="button button--flex"> {{ $t("download.cv") }}<i class="uil uil-download-alt button__icon"></i> </a>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  data() {
    return { path: process.env.BASE_URL };
  },
});
</script>
