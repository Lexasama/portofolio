<template>
  <div>
    <section class="qualification section">
      <h2 class="section__title">{{ $t("qualification.title") }}</h2>
      <span class="section__subtitle">{{ $t("qualification.subtitle") }}</span>

      <div class="qualification__container container">
        <div class="qualification__tabs">
          <div class="qualification__button button--flex qualification__active" @click="isWork = false">
            <i class="uil uil-graduation-cap qualification__icon"></i>
            {{ $t("education") }}
          </div>

          <div class="qualification__button button--flex" @click="isWork = true">
            <i class="uil uil-briefcase-alt qualification__icon"></i>
            {{ $t("work") }}
          </div>
        </div>

        <div class="qualification__sections">
          <!--=============== QUALIFICATION CONTENT 1 ===============-->
          <div class="qualification__content qualification__active" v-if="!isWork" id="education">
            <!--=============== QUALIFICATION 1 ===============-->
            <div class="qualification__data">
              <div>
                <h3 class="qualification__title">{{$t("qualification.content1.title")}}</h3>
                <span class="qualification__subtitle">{{$t("qualification.content1.subtitle")}}</span>
                <div class="qualification__calendar">
                  <i class="uil uil-calendar-alt"></i>
                  2013 - 2016
                </div>
              </div>

              <div>
                <span class="qualification__rounder"></span>
                <span class="qualification__line"></span>
              </div>
            </div>

            <!--=============== QUALIFICATION 2 ===============-->
            <div class="qualification__data">
              <div></div>

              <div>
                <span class="qualification__rounder"></span>
                <span class="qualification__line"></span>
              </div>

              <div>
                <h3 class="qualification__title">{{$t("qualification.content2.title")}}</h3>
                <span class="qualification__subtitle">Aix-en-provence <br> Aix Marseille University</span>
                <div class="qualification__calendar">
                  <i class="uil uil-calendar-alt"></i>
                  2016 - 2018
                </div>
              </div>
            </div>

            <!--=============== QUALIFICATION 3 ===============-->
            <div class="qualification__data">
              <div>
                <h3 class="qualification__title">{{ $t("qualification.content3.title")}}</h3>
                <span class="qualification__subtitle">Paris - In'tech</span>
                <div class="qualification__calendar">
                  <i class="uil uil-calendar-alt"></i>
                  2018 - 2020
                </div>
              </div>

              <div>
                <span class="qualification__rounder"></span>
                <span class="qualification__line"></span>
              </div>
            </div>

            <!--=============== QUALIFICATION 4 ===============-->
            <div class="qualification__data">
              <div></div>

              <div class="qualification__time">
                <span class="qualification__rounder"></span>
              </div>

              <div>
                <h3 class="qualification__title">{{$t("qualification.content4.title")}}</h3>
                <span class="qualification__subtitle">Paris - In'tech</span>
                <div class="qualification__calendar">
                  <i class="uil uil-calendar-alt"></i>
                  2020 - 2022
                </div>
              </div>
            </div>
          </div>

          <!--=============== QUALIFICATION CONTENT 2 ===============-->
          <div class="qualification__content" v-if="isWork" id="work">
            <!--=============== QUALIFICATION 1 ===============-->
            <div class="qualification__data">
              <div>
                <h3 class="qualification__title">{{$t('internship')}}</h3>
                <span class="qualification__subtitle">COSIUM - Versailles</span>
                <div class="qualification__calendar">
                  <i class="uil uil-calendar-alt"></i>
                  Feb. - Aug. 2020
                </div>
              </div>

              <div>
                <span class="qualification__rounder"></span>
                <span class="qualification__line"></span>
              </div>
            </div>

            <!--=============== QUALIFICATION 2 ===============-->
            <div class="qualification__data">
              <div></div>

              <div class="qualification__time">
                <span class="qualification__rounder"></span>
                <span class="qualification__line"></span>
              </div>

              <div>
                <h3 class="qualification__title">{{$t('work.study')}}</h3>
                <span class="qualification__subtitle">COSIUM - Versailles</span>
                <div class="qualification__calendar">
                  <i class="uil uil-calendar-alt"></i>
                  2020-2021
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

@Component
export default class Qualification extends Vue {
  private isWork = false;
}
</script>
