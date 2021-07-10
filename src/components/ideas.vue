<template>
  <div>
    <section class="project section" id="project">
      <div class="project__bg">
        <div class="project__container container grid">
          <div class="project__data">
            <h2 class="project__title">{{$t("ideas.title")}}</h2>
            <p class="project__description">{{$t("ideas.description")}}</p>
            <a href="#contact" class="button button--flex button--white">
              {{$t("contact.title")}}
              <i class="uil uil-message button__icon"></i>
            </a>
          </div>

          <img src="@/assets/img/project.png" alt="" class="project__img" />
        </div>
      </div>
    </section>
  </div>
</template>
