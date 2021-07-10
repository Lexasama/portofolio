<template>
  <div>
    <section class="contact section" id="contact">
      <h2 class="section__title">{{ $t("contact.title") }}</h2>
      <span class="section__subtitle">{{ $t("contact.subtitle") }}</span>
      <div class="contact__container container grid">
        <div>
          <div class="contact__information">
            <i class="uil uil-phone contact__icon"></i>
            <div>
              <h3 class="contact__title">{{ $t("phone") }}</h3>
              <span class="contact__subtitle"
                ><a href="tel:+33673271265">{{ $t("call.me") }}</a>
              </span>
            </div>
          </div>

          <div class="contact__information">
            <i class="uil uil-envelope contact__icon"></i>
            <div>
              <h3 class="contact__title">{{ $t("email") }}</h3>
              <span class="contact__subtitle">
                <a href="mailto: sanon@et.intechinfo.com">{{ $t("send.email") }}</a>
              </span>
            </div>
          </div>

          <div class="contact__information">
            <i class="uil uil-map-marker contact__icon"></i>
            <div>
              <h3 class="contact__title">{{ $t("location") }}</h3>
              <span class="contact__subtitle">Versailles, France</span>
            </div>
          </div>
        </div>

        <form @submit.prevent="sendEmail" class="contact__form grid" id="contactForm" ref="contactForm">
          <div v-if="hasError" class="alert contact__content" :style="errorStyle">
            <span class="closebtn" @click="errorStyle.display = 'none'">&times;</span>
            <strong>{{ status }}</strong> {{ errorMessage }} <br />
            <div>
              <ul v-if="errors.length > 0" class="services__modal-services grid">
                <li class="services__modal-service" v-for="error in errors" :key="error">
                  <i class="uil uil-times services__modal-icon"></i>
                  <p>{{ error }}</p>
                </li>
              </ul>
            </div>
          </div>

          <div class="contact__inputs grid">
            <div class="contact__content">
              <label for="name-input" class="contact__label">{{ $t("name") }}</label>
              <input type="text" name="name" id="name-input" class="contact__input" v-model="name" required />
            </div>
            <div class="contact__content">
              <label for="email-input" class="contact__label">{{ $t("email") }}</label>
              <input type="email" name="email" id="email-input" class="contact__input" v-model="email" required />
            </div>
          </div>
          <div class="contact__content">
            <label for="project-input" class="contact__label">{{ $t("project") }}</label>
            <input type="text" name="project" id="project-input" class="contact__input" v-model="project" required />
          </div>
          <div class="contact__content">
            <label for="massage-input" class="contact__label">{{ $t("message") }}</label>
            <textarea name="message" id="message-input" cols="0" rows="7" class="contact__input" v-model="message" required></textarea>
          </div>

          <div>
            <a href="#" class="button button--flex" @click.prevent="sendEmail">
              {{ $t("send.message") }}
              <i class="uil uil-message button__icon"></i>
            </a>
          </div>
        </form>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import emailjs from "emailjs-com";

@Component
export default class Contact extends Vue {
  private name = "";
  private email = "";
  private message = "";
  private project = "";
  private errors: string[] = [];
  private hasError = false;
  private serviceId = process.env.VUE_APP_SERVICE_ID;
  private templateId = process.env.VUE_APP_TEMPLATE_ID;
  private userId = process.env.VUE_APP_EMAIL_USER_ID;
  private errorStyle = {
    display: "none",
    backgroundColor: "red",
  };
  private status = this.$t("sorry");
  private errorMessage = this.$t("error.required");

  private sendEmail() {
    this.checkForm();

    this.hasError = this.errors.length > 0;

    if (!this.hasError) {
      try {
        emailjs.sendForm(this.serviceId, this.templateId, this.$refs.contactForm as HTMLFormElement, this.userId);
        this.resetContactForm();
        this.successToast();
        return;
      } catch (error) {
        this.errors = [];
        console.log({ error });
        this.failureToast();
      }
    }
    this.failureToast();
  }

  private successToast() {
    this.status = this.$t("success");
    this.errorMessage = this.$t("succes.message-sent") + " !";
    this.errorStyle.display = "block";
    this.errorStyle.backgroundColor = "#74e454";
    this.hasError = true;
  }
  private failureToast() {
    this.status = this.$t("sorry");
    this.errorMessage = this.$t("error.required");
    if (this.errors.length == 0) {
      this.errorMessage = this.$t("error-something-went-wrong").toString() + this.$t("error.try-again");
    }
    this.errorStyle.display = "block";
    this.hasError = true;
  }
  private resetContactForm() {
    this.name = "";
    this.email = "";
    this.message = "";
    this.project = "";
  }

  private checkForm() {
    this.errors = [];
    if (this.isBlank(this.name)) {
      this.errors.push(this.createErrorMessage("name"));
    }

    if (this.isBlank(this.email)) {
      this.errors.push(this.createErrorMessage("email"));
    } else if (!this.isValidEmail(this.email)) {
      this.errors.push(this.concatTanslatedMessage("email", "error.invalid-field"));
    }

    if (this.isBlank(this.message)) {
      this.errors.push(this.createErrorMessage("message"));
    } else if (this.message.length < 5) {
      this.errors.push(this.concatTanslatedMessage("message", "error.field-is-too-short"));
    }

    if (this.isBlank(this.project)) {
      this.errors.push(this.createErrorMessage("project"));
    }
  }

  private isBlank(string: string): boolean {
    return string == "" || string == null;
  }

  private isValidEmail(email: string): boolean {
    const emailRegEx = /^[^\s@]+@[^\s@]+$/;
    return emailRegEx.test(String(email).toLowerCase());
  }

  private createErrorMessage(field: string): string {
    return this.concatTanslatedMessage(field, "error.field-is-required");
  }

  private concatTanslatedMessage(unstranslatedField: string, concat: string): string {
    const translatedField = this.$t(unstranslatedField);
    return this.$t(concat, { field: translatedField }).toString();
  }
}
</script>

<style scoped>
.alert {
  padding: 20px;
  background-color: #74e454;
  color: white;
  visibility: visible;
  -webkit-animation: fadein 0.5s, expand 0.5s 0.5s, stay 3s 1s, shrink 0.5s 2s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, expand 0.5s 0.5s, stay 3s 1s, shrink 0.5s 4s, fadeout 0.5s 4.5s;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>
