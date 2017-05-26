(function($) {
  var gridOpts = {
    'title': '',
    'data': '',
    'cls': '',
    'url': '',
    'params': {},
    'maxRecords': 5,
    lineHeight: 25,
    listeners: {
      initRows: {
        before: function(e, t) {
          if (!t.data || !t.data.length) {
            t.el.append('<div class="nodata"><span>暂无数据...</span></div>');
            var h = t.maxRecords * t.lineHeight + "px";
            t.el.css({
              height: h,
              'line-height': h,
              'text-align': 'center',
              'font-size': '18px'
            });
          }
        }
      }
    },
    'renderTo': null
  };
  Tee.createComponent('Grid', gridOpts, Tee.Component.prototype, {
    initComponent: function() {
      var t = this;
      this.initRows();
      this.el.css({
        height: this.maxRecords * this.lineHeight + "px"
      });
    },
    rowRender: function(i, e) {
      var content = $('<div></div>');
      $.each(e.cells || [], function(index, el) {
        var element;
        if (el.type == '' || el.type.toLowerCase() == 'text') {
          element = $('<span></span>');
          element.html(el.text);
        }
        else if (el.type.toLowerCase() == 'link' || el.type.toLowerCase() == 'img'){
          element = $('<a></a>');
          element.html(el.text);
        }
        else {
          elment = $('<span></span>');
        }
        Tee.addPros(element, el);
        content.append(element);
      });
      return content;
    },
    initRows: function() {
      var ul = $('<ul></ul>');
      ul.appendTo(this.el);
      var self = this;
      $.each(this.data || [], function(i, e) {
        if (i >= self.maxRecords) {
          return;
        }
        var li = $('<li></li>');
        var liContent = self.rowRender(i, e);
        li.append(liContent);
        li.appendTo(ul);
      });
    }
  });
  
  Tee.Image = function(cfg) {
    var opts = {
      'title': '',
      'path': '',
      'cls': '',
      'listeners': {
        'click': $.noop
      },
      'describe': '',
      'listeners': {}
    };
    
    $.extend(true, this, opts, cfg);
    this.initialize();
  };
  $.extend(Tee.Image.prototype, new Tee.Component(), {
    initialize: function() {
      this.el.css({
        'text-align': 'center'
      });
      this.el.attr('class', this.cls);
      var a = $('<a href="javascript:void(0)" style="display:block;"></a>');
      a.click(this.listeners.click);
      
      var img = $('<img></img>');
      if (this.path) {
        img.attr('src', this.path);
        a.append(img);
      }
      var describe = '';
      if (this.describe) {
        describe = this.describe;
      }
      
      this.el.append(a).append(describe);
      
      if (this.renderTo) {
        this.renderTo.append(el);
      }
    },
    render: function(el) {
      if (el) {
        this.el.appendTo(el);
      }
    }
  });
  Tee.register['image'] = Tee.Image;
  
  var customOpts = {
    title: '',
    url: '',
    params: {
    },
    data: null,
    renderCmp: $.noop
  };
    
  Tee.createComponent('Custom', customOpts, Tee.Component.prototype, {
    initComponent: function() {
    }
  });
    
  var imgBoxOpts = {
    'title': '',
    'cls': '',
    'imgSize': {
      'height': 125,
      'width': 225
    },
    'maxRecords': 5,
    'delay': 3000,
    'loader': null,
    'data': null,
    'params': {},
    'renderTo': null,
    listeners: {
      initContent: {
        before: function(e, t) {
          if (!t.data || !t.data.length) {
            t.el.append('<div class="nodata" style="line-height: 125px"><span>暂无数据...</span></div>');
            var h =  "125px";
            t.el.css({
              'height': h,
              'line-height': h,
              'text-align': 'center',
              'font-size': '18px'
            });
          }
        }
      }
    }
  };
  
  Tee.createComponent('ImgBox', imgBoxOpts, Tee.Component.prototype, {
    'initComponent': function() {
      this.el.addClass("Tee-imgbox");
      this.container = $('<div class="Tee-imgbox-container"></div>');
      
      this.imgs = $('<div class="Tee-imgbox-imgs"></div>');
      var div = $('<div class="Tee-imgbox-texts"></div>');
      this.texts = $("<ul></ul>")
      this.el.append(this.container.append(this.imgs).append(div.append(this.texts)));
      
      this.initContent();
      this.initScroll();
      this.initMouseEvent();
    },
    'initScroll': function() {
      this.doScroll();
      this.imgsHeight = (this.data.length > 5 ? this.maxRecords : this.data.length) * this.imgSize.height;
      this.scrollHeight = 0;
    },
    'scroll': function() {
      this.scrollHeight += this.imgSize.height;
      if (this.scrollHeight > this.imgsHeight - this.imgSize.height) {
        this.scrollHeight = 0;
      }
      
      this.imgs.stop().animate({
        top: - this.scrollHeight
      }, "slow");
      this.doScroll();
    },
    'doScroll': function() {
      var t = this;
      
      this.task = setTimeout(function() {
        t.scroll.call(t);
      }, t.delay);
    },
    'initMouseEvent': function() {
      var imgs = this.texts.children();
      var t = this;
      $.each(imgs || [], function(i, e) {
        $(e).mouseover(function() {
          clearTimeout(t.task);
          var top = i * t.imgSize.height;
          t.imgs.stop().animate({
            top: - top
          }, "normal");
        });
        $(e).mouseout(function() {
          t.doScroll();
        });
      });
    },
    'initContent': function() {
      if (this.data) {
        var t = this;
        $.each(this.data, function(i, el){
          if (i >= t.maxRecords) {
            return;
          }
          var e = el.cells[0];
          var a4Img = $('<a></a>');
          var img = $('<img></img>');
          a4Img.append(img);
          t.imgs.append(a4Img);
          
          var li = $('<li></li>');
          var a4Text = $('<a></a>');
          var span = $('<span></span>');
          span.html(e.text);
          a4Text.append(span);
          t.texts.append(li.append(a4Text));
          
          Tee.addPros(img, e);
          Tee.addPros(a4Text, e);
          Tee.addPros(a4Img, e);
        });
      }
    }
  });
})(jQuery);