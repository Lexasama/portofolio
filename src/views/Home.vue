<template>
  <div class="home">
    <body>
      <!--==================== HEADER ====================-->
      <header class="header" id="header">
        <navBar />
      </header>

      <!--==================== MAIN ====================-->
      <main class="main">
        <!--==================== HOME ====================-->
        <profile />

        <!--==================== ABOUT ====================-->
        <about />

        <!--==================== SKILLS ====================-->
        <skills />

        <!--==================== QUALIFICATION ====================-->
        <qualification />

        <!--==================== PORTFOLIO ====================-->
        <portofolio />

        <!--==================== PROJECT IN MIND ====================-->
        <ideas />

        <!--==================== CONTACT ME ====================-->
        <contact />
      </main>

      <!--==================== FOOTER ====================-->
      <footer class="footer">
        <footer-component />
      </footer>

      <!--========== SCROLL TOP ==========-->
      <a href="#" class="scrollup" id="scroll-top">
        <i class="uil uil-arrow-up scrollup__icon"></i>
      </a>
    </body>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import About from "@/components/about.vue";
import Contact from "@/components/contact.vue";
import FooterComponent from "@/components/footer.vue";
import Ideas from "@/components/ideas.vue";
import NavBar from "@/components/nav.vue";
import Portofolio from "@/components/portofolio.vue";
import Profile from "@/components/profile.vue";
import Qualification from "@/components/qualification.vue";
import Skills from "@/components/skills.vue";

import "@/assets/js/main.js";

@Component({
  components: {
    About,
    Contact,
    FooterComponent,
    Ideas,
    NavBar,
    Portofolio,
    Profile,
    Qualification,
    Skills
  },
})
export default class Home extends Vue {}
</script>

<style>
/*==================== UNICONS ====================*/
@import url("https://unicons.iconscout.com/release/v3.0.6/css/line.css");

/*==================== SWIPPER CSS ====================*/
@import "../styles/swiper-bundle.min.css";
</style>
<style lang="scss">
@import "../styles/styles.scss";
</style>
