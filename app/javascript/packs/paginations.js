$('#pagination_link').on('click', function() {
    if($(this).hasClass('disabled'))
      return;
    // do work
    $(this).addClass('disabled');
  });