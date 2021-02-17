// 유튜브 플러그인 시작
function youtubePlugin() {
  toastui.Editor.codeBlockManager.setReplacer('youtube', youtubeId => {
    // Indentify multiple code blocks
    const wrapperId = `yt${Math.random().toString(36).substr(2, 10)}`;

    // Avoid sanitizing iframe tag
    setTimeout(renderYoutube.bind(null, wrapperId, youtubeId), 0);

    return `<div id="${wrapperId}"></div>`;
  });
}

function renderYoutube(wrapperId, youtubeId) {
  const el = document.querySelector(`#${wrapperId}`);

  el.innerHTML = `<div class="toast-ui-youtube-plugin-wrap"><iframe src="https://www.youtube.com/embed/${youtubeId}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>`;
}
// 유튜브 플러그인 끝

// codepen 플러그인 시작
function codepenPlugin() {
  toastui.Editor.codeBlockManager.setReplacer('codepen', url => {
    const wrapperId = `yt${Math.random().toString(36).substr(2, 10)}`;

    // Avoid sanitizing iframe tag
    setTimeout(renderCodepen.bind(null, wrapperId, url), 0);

    return `<div id="${wrapperId}"></div>`;
  });
}

function renderCodepen(wrapperId, url) {
  const el = document.querySelector(`#${wrapperId}`);

  var urlParams = new URLSearchParams(url.split('?')[1]);
  var height = urlParams.get('height');

  el.innerHTML = `<div class="toast-ui-codepen-plugin-wrap"><iframe height="${height}" scrolling="no" src="${url}" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true"></iframe></div>`;
}
// codepen 플러그인 끝

function Editor__init() {
  $('.toast-ui-editor').each(function(index, node) {
    var initialValue = $(node).prev().html().trim().replace(/t-script/gi, 'script');

    if ( initialValue.length == 0 ) {
		initialValue = " ";
	}
    
   let height = 600;

	if ( $(node).attr('data-height') ) {
		height = parseInt($(node).attr('data-height'));
	}

	let previewStyle = 'vertical';

	if ( $(node).attr('data-previewStyle') ) {
		previewStyle = $(node).attr('data-previewStyle');
	}
	else {
		if ( $(window).width() < 600 ) {
			previewStyle = 'tab';
		}
	}

	var editor = new toastui.Editor({
      el: node,
      previewStyle: previewStyle,
      initialValue: initialValue,
      height:height,
      plugins: [toastui.Editor.plugin.codeSyntaxHighlight, youtubePlugin, codepenPlugin]
    });

	$(node).data('data-toast-editor', editor);
  });
}

function EditorViewer__init() {
  $('.toast-ui-viewer').each(function(index, node) {
    var initialValue = $(node).prev().html().trim().replace(/t-script/gi, 'script');
    var viewer = new toastui.Editor.factory({
      el: node,
      initialValue: initialValue,
      viewer:true,
      plugins: [toastui.Editor.plugin.codeSyntaxHighlight, youtubePlugin, codepenPlugin]
    });
  });
}

$(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        //autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
    });
});


// html dom 이 다 로딩된 후 실행된다.
$(document).ready(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu>a").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
});

//html dom 이 다 로딩된 후 실행된다.
$(document).ready(function(){
    // menu-box 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu-box > a").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
});


EditorViewer__init();
Editor__init(); 