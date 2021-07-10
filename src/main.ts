import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import VueI18n from "vue-i18n";


Vue.use(VueI18n);

Vue.config.productionTip = false;

import { messages, defaultLocale } from "@/plugins/i18n";
import store from "./store";
import { Locales } from "./plugins/i18n/locales";

export const i18n = new VueI18n({
  messages,
  locale: defaultLocale,
  fallbackLocale: Locales.EN,
});

new Vue({
  i18n,
  store,
  router,
  render: (h) => h(App),
}).$mount("#app");
