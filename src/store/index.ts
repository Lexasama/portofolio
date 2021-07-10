import Vue from "vue";
import Vuex from "vuex";

import { Locales } from "@/plugins/i18n/locales";
import { defaultLocale } from "@/plugins/i18n";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    language: defaultLocale,
  },
  mutations: {
    SET_LANGUAGE: (state, payload: Locales) => {
      state.language = payload;
    },
  },
});
