function tinymce_load(){
  tinymce.init({
    selector: "textarea.tinymce",
    menu : "core",
    toolbar: "bullist numlist outdent indent | link",
    height : 810
  });
}
$(window).load(tinymce_load());
