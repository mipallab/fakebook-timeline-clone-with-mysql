/**
 *
 * dropdown item toggle
 */
$(document).on("click", "#showSubitem", function (event) {
  const dropDownMenu = this.previousElementSibling;

  // Toggle the class when clicking on #showSubitem
  dropDownMenu.classList.toggle("showSubitem");

  // Prevent the click from propagating to the document
  event.stopPropagation();
});

// Click outside logic
$(document).on("click", function (event) {
  const openMenus = document.querySelectorAll(".showSubitem");
  openMenus.forEach((menu) => {
    // Check if the click is outside the dropdown and the button
    if (!menu.contains(event.target) && event.target.id !== "showSubitem") {
      menu.classList.remove("showSubitem");
    }
  });
});

// detect clicks outside
document.addEventListener("click", handleClickOutside);

var venobox = new VenoBox({
  // Items selector
  selector: ".post-photos-lightbox",

  // color of navigation arrows
  // * jquery version only
  arrowsColor: "#B6B6B6",

  // same as data-autoplay
  autoplay: false,

  // background color
  bgcolor: "#fff",

  // border
  border: "0",

  // custom CSS class
  customClass: false,

  // infinite loop
  // * vanilla JS version only
  infinigall: false,

  // max width
  // * vanilla JS version only
  maxWidth: "700px",

  // navigation options
  // * vanilla JS version only
  navigation: true,
  navKeyboard: true,
  navTouch: true,
  navSpeed: 300,

  // show navigation number and total items in current gallery
  // * vanilla JS version only
  numeration: false,

  // background color of close button
  closeBackground: "#161617",

  // colr of close button
  closeColor: "#d2d2d2",

  // frame width/height
  // * jQuery version only
  framewidth: "",
  frameheight: "",

  // show items as a gallery
  // * jQuery version only
  gallItems: false,

  // custom controls
  // * jQuery version only
  htmlClose: "&times;",
  htmlNext: "<span>Next</span>",
  htmlPrev: "<span>Prev</span>",

  // background color of counter
  // * jQuery version only
  numerationBackground: "#161617",

  // counter color
  // * jQuery version only
  numerationColor: "#d2d2d2",

  // 'top' || 'bottom'
  // * jQuery version only
  numerationPosition: "top",

  // close the lightbox by clicking the background overlay
  overlayClose: true,

  // color of the background overlay
  overlayColor: "rgba(23,23,23,0.85)",

  // show automatic <a href="https://www.jqueryscript.net/tags.php?/popup/">popup</a> on page load
  // * vanilla JS version only
  popup: "false",

  // '1x1' | '4x3' | '16x9' | '21x9' | 'full'
  // * vanilla JS version only
  ratio: "16x9",

  // show sharing buttons for images and videos
  // * vanilla JS version only
  share: false,

  // 'block' | 'pill' | 'transparent' | 'bar'
  // * vanilla JS version only
  shareStyle: "bar",

  // jQuery version: 'rotating-plane' | 'double-bounce' | 'wave' | 'wandering-cubes' | 'spinner-pulse' | 'chasing-dots' | 'three-bounce' | 'circle' | 'cube-<a href="https://www.jqueryscript.net/tags.php?/grid/">grid</a>' | 'fading-circle' | 'folding-cube'
  // Vanilla JS version: 'plane' | 'chase' | 'bounce' | 'wave' | 'pulse' | 'flow' | 'swing' | 'circle' | 'circle-fade' | 'grid' | 'fold | 'wander'
  spinner: "double-bounce",

  // spinner color
  spinColor: "#d2d2d2",

  // same as data-title
  titleattr: "title",

  // 'top' || 'bottom'
  titlePosition: "top",

  // title background color
  // * jQuery version only
  titleBackground: "#161617",

  // title color
  // * jQuery version only
  titleColor: "#d2d2d2",

  // background color of title and share buttons
  // * vanilla JS version only
  toolsBackground: "#1C1C1C",

  // color of Title, Share buttons and gallery navigation
  // * vanilla JS version only
  toolsColor: "#d2d2d2",

  // jQuery selectors
  jQuerySelectors: false,

  // focus current element on window close
  focusItem: false,

  // resize the images to fit within the viewport
  fitView: false,

  // initial scale
  initialScale: 0.9,

  // transition speed in ms
  transitionSpeed: 200,
});

var vboxOptions = {
  selector: ".post-photos-lightbox",

  // is called after plugin initialization.
  onInit: function (plugin) {
    console.log("INIT");
    console.log(plugin);
  },

  // is called before the venobox pops up, return false to prevent opening;
  onPreOpen: function (obj) {
    console.log("PRE OPEN");
    console.log(obj);
  },

  // is called when opening is finished
  onPostOpen: function (obj, gallIndex, thenext, theprev) {
    console.log("POST OPEN");
    console.log("current gallery index: " + gallIndex);
    console.log(thenext);
    console.log(theprev);
  },

  // is called before closing, return false to prevent closing
  onPreClose: function (obj, gallIndex, thenext, theprev) {
    console.log("PRE CLOSE");
    console.log("current gallery index: " + gallIndex);
    console.log(thenext);
    console.log(theprev);
  },

  // is called after gallery navigation step
  onNavComplete: function (obj, gallIndex, thenext, theprev) {
    console.log("POST NAV");
    console.log("current gallery index: " + gallIndex);
    console.log(thenext);
    console.log(theprev);
  },

  // is called after new content loaded
  onContentLoaded: function (newcontent) {
    console.log("NEW CONTENT");
    console.log(newcontent);
  },
};
new VenoBox(vboxOptions);
