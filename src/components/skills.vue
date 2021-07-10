<template>
  <div>
    <!--==================== SKILLS ====================-->
    <section class="skills section" id="skills">
      <h2 class="section__title">{{ $t("skills") }}</h2>
      <span class="section__subtitle">{{ $t("my.technical.level") }}</span>

      <div class="skills__container container grid">
        <div>
          <!--=============== SKILLS 1 ===============-->
          <div class="skills__content" :class="skills1 ? 'skills__open' : 'skills__close'">
            <div class="skills__header" @click="skills1 = !skills1">
              <i class="uil uil-brackets-curly skills__icon"></i>

              <div>
                <h1 class="skills__title">{{ $t("frontend.developer") }}</h1>
                <span class="skills__subtitle">{{ $t("more.than.field.years", { field: 2 }) }}</span>
              </div>

              <i class="uil uil-angle-down skills__arrow"></i>
            </div>

            <div class="skills__list grid">
              <div class="skills__data">
                <div class="skills__titles">
                  <h3 class="skills__name">HTML</h3>
                  <span class="skills__number">80%</span>
                </div>
                <div class="skills__bar">
                  <span class="skills__percentage skills__html"></span>
                </div>
              </div>

              <div class="skills__data">
                <div class="skills__titles">
                  <h3 class="skills__name">CSS</h3>
                  <span class="skills__number">50%</span>
                </div>
                <div class="skills__bar">
                  <span class="skills__percentage skills__css"></span>
                </div>
              </div>

              <div class="skills__data">
                <div class="skills__titles">
                  <h3 class="skills__name">JavaScript & Typescript</h3>
                  <span class="skills__number">80%</span>
                </div>
                <div class="skills__bar">
                  <span class="skills__percentage skills__js"></span>
                </div>
              </div>

              <div class="skills__data">
                <div class="skills__titles">
                  <h3 class="skills__name">VueJS</h3>
                  <span class="skills__number">85%</span>
                </div>
                <div class="skills__bar">
                  <span class="skills__percentage skills__vue"></span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div>
          <!--=============== SKILLS 2 ===============-->
          <div class="skills__content" :class="skills2 ? 'skills__open' : 'skills__close'">
            <div class="skills__header" @click="skills2 = !skills2">
              <i class="uil uil-swatchbook skills__icon"></i>

              <div>
                <h1 class="skills__title">{{ $t("backend.developer") }}</h1>
                <span class="skills__subtitle">{{ $t("more.than.field.years", { field: 2 }) }}</span>
              </div>

              <i class="uil uil-angle-down skills__arrow"></i>
            </div>

            <div class="skills__list grid">
              <div class="skills__data">
                <div class="skills__titles">
                  <h3 class="skills__name">C#</h3>
                  <span class="skills__number">80%</span>
                </div>
                <div class="skills__bar">
                  <span class="skills__percentage skills__csharp"></span>
                </div>
              </div>

              <div class="skills__data">
                <div class="skills__titles">
                  <h3 class="skills__name">JAVA</h3>
                  <span class="skills__number">75%</span>
                </div>
                <div class="skills__bar">
                  <span class="skills__percentage skills__java"></span>
                </div>
              </div>

              <div class="skills__data">
                <div class="skills__titles">
                  <h3 class="skills__name">Transact SQL</h3>
                  <span class="skills__number">75%</span>
                </div>
                <div class="skills__bar">
                  <span class="skills__percentage skills__tsql"></span>
                </div>
              </div>

              <div class="skills__data">
                <div class="skills__titles">
                  <h3 class="skills__name">PostgreSQL</h3>
                  <span class="skills__number">65%</span>
                </div>
                <div class="skills__bar">
                  <span class="skills__percentage skills__postgres"></span>
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
export default class Skills extends Vue {
  private skills1 = true;
  private skills2 = true;

  private toggleSkills(event) {
    const p = event.target.parentElement.parentElement;
    p.className = p.className == "skills__content skills__close" ? "skills__content skills__open" : "skills__content skills__close";
  }
}
</script>
