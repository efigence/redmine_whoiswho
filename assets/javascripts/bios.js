(function($){

  var bios = {
    init: function(){
       this.bindClick();
       this.bindQuery();
    },

    preview: function(bio_path) {
      $.ajax({
        url: bio_path
      })
        .done(function( data ) {
          $('.splitcontentright').empty().append($(data).html());
          $('.splitcontentright').fadeIn('fast');
        });
    },

    bindClick: function() {
      var self = this;
      $('.splitcontentleft .table tr td').off('click').on('click', function(event) {
        var bio_path = $(event.target).parents('tr').data('path')
        self.preview(bio_path);
      });
    },

    bindQuery: function(){
      var self = this,
            form = $('#bios_search'),
            field = $('#query'),
            timeoutid = null;

      form.on('ajax:success', function(event, data){
        var html = $(data).find('.splitcontentleft .table').html(),
              scope = $(data).find('.pagination').html();
        $('.splitcontentleft .table').empty().append(html);
        $('.pagination').empty().append(scope);
        self.bindClick();
      });

      field.on('keyup', function() {
        if(timeoutid){
          clearTimeout(timeoutid)
        }

        timeoutid = setTimeout(function() {
          form.submit();
        }, 500);
      });
    }

  }

  $(function(){
    bios.init()
  });

})(jQuery)
