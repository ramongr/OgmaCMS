convert = ->
  emojione.imageType = 'svg';
  emojione.sprites = true;
  emojione.imagePathSVGSprites = '/emoji/emojione.sprites.svg';
  document.getElementById("emoji-cat-1").innerHTML = emojione.shortnameToImage(":smile:")
  document.getElementById("emoji-cat-2").innerHTML = emojione.shortnameToImage(":dog:")
  document.getElementById("emoji-cat-3").innerHTML = emojione.shortnameToImage(":bell:")
  document.getElementById("emoji-cat-4").innerHTML = emojione.shortnameToImage(":oncoming_automobile:")
  document.getElementById("emoji-cat-5").innerHTML = emojione.shortnameToImage(":hash:")

  document.getElementById("emoji-panel-1").innerHTML = emojione.shortnameToImage(":smile:")
  document.getElementById("emoji-panel-2").innerHTML = emojione.shortnameToImage(":dog:")
  document.getElementById("emoji-panel-3").innerHTML = emojione.shortnameToImage(":bell:")
  document.getElementById("emoji-panel-4").innerHTML = emojione.shortnameToImage(":oncoming_automobile:")
  document.getElementById("emoji-panel-5").innerHTML = emojione.shortnameToImage(":hash:")
  return

$(document).ready(convert)