function unescapeHTML(template) {
  return template
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"');
}

function messageTip(msg) {
  var msgId = Math.floor(Math.random() * 1000000).toString();

  var container = $(".message-tip-container");
  if (container.length === 0) {
    $("body").append(`<div class="message-tip-container"></div>`);
    container = $(".message-tip-container");
  }

  container.append(
    `<div id="message-tip-${msgId}" class="message-tip" style="display: none;">${msg}</div>`
  );
  $(".message-tip").fadeIn();

  function clearMessageTip(msgId) {
    return function() {
      $(`#message-tip-${msgId}`).fadeOut({
        complete: function() {
          $(`#message-tip-${msgId}`).remove();
        }
      });
    };
  }

  setTimeout(clearMessageTip(msgId), 3500);
}
