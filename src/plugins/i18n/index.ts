import { Locales } from "./locales";

import en from "./en.json";
import fr from "./fr.json";

export const messages = {
  [Locales.EN]: en,
  [Locales.FR]: fr
};

const browserLocal = ((navigator.languages && navigator.languages[0]) || '').substr(0, 2) == "en" ? Locales.EN : Locales.FR;
export const defaultLocale = browserLocal;