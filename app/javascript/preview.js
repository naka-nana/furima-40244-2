document.addEventListener('turbo:load', function(){
  const itemForm = document.getElementById('new_item');
  const previewList = document.getElementById('previews');
  let fileField = document.querySelector('input[type="file"][name="item[images][]"]');

  if (!itemForm || !previewList) {
    console.warn("フォームまたはプレビューエリアが見つかりません");
    return;
  }

  const imageLimits = 5;

  // プレビュー画像を生成・表示する関数
  const buildPreviewImage = (dataIndex, blob) => {
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    const deleteButton = document.createElement("div");
    deleteButton.setAttribute("class", "image-delete-button");
    deleteButton.innerText = "削除";

    deleteButton.addEventListener("click", () => deleteImage(dataIndex));

    previewWrapper.appendChild(previewImage);
    previewWrapper.appendChild(deleteButton);
    previewList.appendChild(previewWrapper);
  };

  const buildNewFileField = () => {
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'item[images][]');
    newFileField.setAttribute('data-index', document.querySelectorAll('input[type="file"][name="item[images][]"]').length);

    newFileField.addEventListener("change", changedFileField);
    document.querySelector('.click-upload').appendChild(newFileField);
  };

  const deleteImage = (dataIndex) => {
    const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    deletePreviewImage.remove();
    const deleteFileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`);
    deleteFileField.remove();

    if (document.querySelectorAll(".preview").length == imageLimits - 1) buildNewFileField();
  };

  const changedFileField = (e) => {
    const dataIndex = e.target.getAttribute('data-index');
    const file = e.target.files[0];

    if (!file) {
      deleteImage(dataIndex);
      return;
    }

    const blob = window.URL.createObjectURL(file);
    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);

    if (alreadyPreview) {
      alreadyPreview.querySelector("img").setAttribute("src", blob);
      return;
    }

    buildPreviewImage(dataIndex, blob);

    if (document.querySelectorAll(".preview").length < imageLimits) buildNewFileField();
  };

  fileField.addEventListener('change', changedFileField);
});