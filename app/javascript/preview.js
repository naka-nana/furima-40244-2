document.addEventListener('turbo:load', function () {
  const currentPath = window.location.pathname;

  if (currentPath === '/items/new') {
    const postForm = document.getElementById('new_item');
    const previewList = document.getElementById('previews');

    if (!postForm || !previewList) {
      console.warn("フォームまたはプレビューエリアが見つかりません");
      return;
    }

    const fileField = document.querySelector('input[type="file"][name="item[image]"]');

    if (!fileField) {
      console.warn("画像アップロード用のinput要素が見つかりません");
      return;
    }

    fileField.addEventListener('change', function (e) {
      const file = e.target.files[0];
      if (!file) {
        console.warn("ファイルが選択されませんでした");
        return;
      }

      const blob = window.URL.createObjectURL(file);

      // プレビューエリアをクリア
      previewList.innerHTML = '';

      // プレビュー用のdiv要素を生成
      const previewWrapper = document.createElement('div');
      previewWrapper.setAttribute('class', 'preview');

      // 画像要素を生成
      const previewImage = document.createElement('img');
      previewImage.setAttribute('class', 'preview-image');
      previewImage.setAttribute('src', blob);

      // 画像をプレビューエリアに追加
      previewWrapper.appendChild(previewImage);
      previewList.appendChild(previewWrapper);
    });

    console.log("preview.jsが正常に読み込まれました");
  }
});