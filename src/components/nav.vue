<template>
  <div>
    <nav class="nav container">
      <a href="#" class="nav__logo">{{ $t('name.value')}}</a>

      <div class="nav__menu" id="nav-menu" @click="toggleMenu">
        <ul class="nav__list grid">
          <li class="nav__item">
            <a href="#home" class="nav__link active-link"> <i class="uil uil-estate nav__icon"></i> {{ $t('nav.home')}} </a>
          </li>

          <li class="nav__item">
            <a href="#about" class="nav__link"> <i class="uil uil-user nav__icon"></i> {{ $t('nav.about')}}  </a>
          </li>

          <li class="nav__item">
            <a href="#skills" class="nav__link"> <i class="uil uil-file-alt nav__icon"></i> {{ $t('skills')}}  </a>
          </li>

          <li class="nav__item">
            <a href="#portfolio" class="nav__link"> <i class="uil uil-scenery nav__icon"></i> {{ $t('nav.portofolio')}}  </a>
          </li>

          <li class="nav__item">
            <a href="#contact" class="nav__link"> <i class="uil uil-message nav__icon"></i>{{ $t('nav.contact-me')}}  </a>
          </li>
        </ul>

        <i class="uil uil-times nav__close" id="nav-close"></i>
      </div>

      <div class="nav__btns">
        <!-- Theme change button -->
        <i class="change-theme uil" :class="isDark ? 'uil-sun' : 'uil-moon'" id="theme-button" @click="toggleTheme()"></i>

        <!-- Language change button -->
        <img class="change-lang" :src="language == 'fr' ? 'https://img.icons8.com/color/20/000000/france.png' : 'https://img.icons8.com/color/20/000000/usa.png'" @click="toggleLanguage" />

        <div class="nav__toggle" id="nav-toggle">
          <i class="uil uil-apps" @click="toggleMenu"></i>
        </div>
      </div>
    </nav>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

@Component
export default class NavBar extends Vue {
  private isDark = true;
  private isOpen = true;
  private language = this.$i18n.locale;

  private mounted() {
    if(localStorage.lang){
      this.language = localStorage.lang;
    }
    if (localStorage.isDark) {
      this.isDark = "true" === localStorage.isDark;
      let theme = "light";
      if (this.isDark) {
        theme = "dark";
      }
      document.body.classList[theme === "dark" ? "add" : "remove"]("dark-theme");
    }
  }

  private toggleTheme() {
    document.body.classList.toggle("dark-theme");
    this.isDark = !this.isDark;
    localStorage.isDark = this.isDark;
  }

  private toggleLanguage() {
    this.language = this.language == "en" ? "fr" : "en";
    this.$i18n.locale = this.language;
    localStorage.lang = this.language;
    this.$store.commit("SET_LANGUAGE", this.language);
  }

  private toggleMenu() {
    const navMenu = document.getElementById("nav-menu");
    if (navMenu) {
      if (this.isOpen) {
        navMenu.classList.add("show-menu");
      } else {
        navMenu.classList.remove("show-menu");
      }
    }
    this.isOpen = !this.isOpen;
  }
}
</script>