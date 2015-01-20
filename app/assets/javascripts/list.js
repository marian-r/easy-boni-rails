$(function () {
    $('.star-rating a[data-remote]').on('ajax:success', function(e, data) {
        $($(this).data('render')).html(data);
    });
});
