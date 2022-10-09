document.addEventListener("turbolinks:load", () => {
  window.copy = function(element){
    var copy = element.closest('.box').querySelector('.hightlight').innerText.trim().replace("      ", "")

    navigator.clipboard.writeText(copy);
  }
});
