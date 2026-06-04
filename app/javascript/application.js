// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", () => {
  const hamburger = document.getElementById("hamburger");
  const nav = document.getElementById("nav");
  if (hamburger && nav) {
    hamburger.addEventListener("click", () => nav.classList.toggle("open"));
  }
});
