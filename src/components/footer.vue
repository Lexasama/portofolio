<template>
    <div>
        <div class="footer__bg">
          <div class="footer__container container grid">
            <div>
              <h1 class="footer__title">Axel</h1>
              <span class="footer__subtitle">{{$t("fullstack.devellopper")}}</span>
            </div>

            <ul class="footer__links">
              <li>
                <a href="#project" class="footer__link">{{$t('project')}}</a>
              </li>
              <li>
                <a href="#portfolio" class="footer__link">{{$t('nav.portofolio')}}</a>
              </li>
              <li>
                <a href="#contact" class="footer__link">{{$t('nav.contact-me')}}</a>
              </li>
            </ul>

            <div class="footer__socials">
              <a href="https://www.facebook.com/" target="_blank" class="footer__social">
                <i class="uil uil-facebook-f"></i>
              </a>
              <a href="https://www.instagram.com/" target="_blank" class="footer__social">
                <i class="uil uil-instagram"></i>
              </a>
              <a href="https://twitter.com/" target="_blank" class="footer__social">
                <i class="uil uil-twitter-alt"></i>
              </a>
            </div>
          </div>

          <p class="footer__copy">&#169; BlackVolta-tech. All right reserved</p>
        </div>
    </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
    
})
</script>