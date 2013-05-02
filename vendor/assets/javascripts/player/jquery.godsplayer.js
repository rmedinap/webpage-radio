/* GodsPlayer v1.0 - Pete Chronopoulos */

var isMobile = navigator.userAgent.toLowerCase().indexOf('mobile') > -1;
var isAndroid = isMobile && navigator.userAgent.toLowerCase().indexOf('android') > -1;
var isChrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
var isSafari = !isChrome && !isAndroid && navigator.userAgent.toLowerCase().indexOf('applewebkit') > -1;
var isIOS = isMobile && isSafari;
var isBlackBerry = false;
var isWindowsPhone = false;

var godsplayer_instances = new Array();
var installUrl = "/assets/player/"
var debug = false;
var iosWorkaround = false;

if(debug) {
    function deb(x) {console.debug(x);}
} else
    var deb = function() {};

if(!isMobile) {
  $.ajax({url: installUrl+'jwplayer.js', dataType: 'script', cache: true, async: false});
}

deb("*** INSTALLURL = "+installUrl);
$(window).ready(function() {
 $(window).on('beforeunload', function() {
  jQuery.each(godsplayer_instances, function(index, obj) {
    obj.player.destroy();
  });
 });
});

//----------------------------------------------------------------------------------------------

function setOnClass(el, v) {
  //deb('setOnClass('+el+') = '+v);
  if(v) el.addClass('on');
  else el.removeClass('on');
}

//----------------------------------------------------------------------------------------------

function GodsPlayer(config) {
 var me = this;
 this.config = config;
 this.display_hnd = null;
 deb('Creating new GodsPlayer with config '+config);
 $(document).ready(function() {
  godsplayer_instances.push(me);
  var domain = $('#'+config.id);
  me.title = domain.find('.title');
  me.subtitle = domain.find('.subtitle');
  me.artworkUrl = '';
  me._old_search_term = '';
  me.mute_button = domain.find('.mute-button');
  if(me.mute_button == undefined)
    deb('***** Cannot find #'+config.id+' .mute-button');
  me.power_button = domain.find('.power-button');
  if(me.power_button == undefined)
    deb('***** Cannot find #'+config.id+' .power-button');
 if(config.enableArtwork == undefined || !config.enableArtwork) {
    deb('***** Artwork disabled');
    me.cover = null;
  } else
    me.cover = domain.find('.cover');
  me.volume_slot = domain.find('.volume');
  me.slider = domain.find('.slider');
  me.urlProvider = new UrlProvider(me);
  me.urlProvider.reset(config.streamUrl, config.streamUrl2);
  if(isIOS) {
    config.power = false;
    config.mute = false;
    me.volume_slot.hide();
    me.mute_button.hide();
    var iosStreamUrl = me.config.iosStreamUrl == undefined? me.config.streamUrl : me.config.iosStreamUrl;
    var iosStreamUrl2 = me.config.iosStreamUrl2 == undefined? me.config.streamUrl2 : me.config.iosStreamUrl2;
    me.urlProvider.reset(iosStreamUrl, iosStreamUrl2);
    config.streamFormat = config.iosStreamFormat == undefined? config.streamFormat : config.iosStreamFormat;
    deb('using ios-flavoured JPlayer '+me.urlProvider.currentUrl);
    me.player = new Player(domain, config, me.urlProvider); // NO INTRO FOR MOBILES!
  } else if(isAndroid) {
    deb('using JPlayer on Android');
    var androidStreamUrl  = me.config.androidStreamUrl == undefined? me.config.streamUrl : me.config.androidStreamUrl;
    var androidStreamUrl2 = me.config.androidStreamUrl2 == undefined? me.config.streamUrl2 : me.config.androidStreamUrl2;
    me.urlProvider.reset(androidStreamUrl, androidStreamUrl2);
    config.streamFormat = config.androidStreamFormat == undefined? config.streamFormat : config.androidStreamFormat;
    me.player = new Player(domain, config, me.urlProvider); // NO INTRO FOR MOBILES!
  } else if(config.streamFormat == 'm4a' || config.streamFormat == 'flv') {// || config.streamFormat == 'mp3') {
    deb('using AACPlusPlayer '+config.streamUrl);
    me.player = new AACPlusPlayer(domain, config, me.urlProvider);
    me.player.create();
  } else {
    deb('using JPlayer');
    me.player = new Player(domain, config, me.urlProvider);
  }
  me.volume_slot.mouseup(function(ev) {me.endMove(ev);});
  me.mute_button.click(function() {me.switchMute();});
  me.power_button.click(function() {me.switchPower();});
  // setTimeout(function() {me.updateDisplay();}, 3000+5000*(godsplayer_instances.length-1));
  if(isMobile) {
    if(isIOS && ! iosWorkaround) {
      me.switchPower(config.power);
      me.switchMute(config.mute);
    }
  } else {
    me.updateVolume(config.volume);
    me.switchPower(config.power);
    me.switchMute(config.mute);
  }
 });
}

//----------------------------------------------------------------------------------------------

GodsPlayer.prototype.switchMute = function(v) {
  if(v == undefined) v = !this.config.mute;
  this.config.mute = v;
  this.player.setVolume(v? 0 : this.config.volume);
  setOnClass(this.mute_button, v);
}

//----------------------------------------------------------------------------------------------

GodsPlayer.prototype.switchPower = function(on) {
  if(on == undefined) on = !this.config.power;
  // Switch off other possible players.
  if(on)
    for(var i=0; i < godsplayer_instances.length; i++) {
      var instance = godsplayer_instances[i];
      if(instance != this) {
      deb('switching off: '+instance);
        instance.switchPower(false);
      }
    }
  this.config.power = on;
  setOnClass(this.power_button, on);
  if(isIOS) {
    if(iosWorkaround) {
      if(!on) {
        this.player.destroy();
      } else {
        this.player.create();
        var me = this.player;
        setTimeout(function() {me.play();}, 120);
      }
    } else {
     if(!on) {
      this.player.destroy();
      this.player.willRecreate(10);
     } else {
      this.player.play();
     }
    }
  } else {
    if(!on) {
      this.switchMute(false);
      this.player.destroy();
    } else {
      this.player.willRecreate(10);
    }
  }
}

//----------------------------------------------------------------------------------------------

GodsPlayer.prototype.button = function(name)
{
    deb('button pressed: "'+name+'"');
    if(name == '-') {
         this.config.volume = this.config.volume-0.05 > 0? this.config.volume - 0.05 : 0;
         if(!mute) this.player.setVolume(this.config.volume);
    } else if(name == '+') {
         this.config.volume = this.config.volume + 0.05 < 1? this.config.volume + 0.05 : 1;
         if(!this.config.mute) player.setVolume(this.config.volume);
    } else if(name == 'mute') {
        this.switchMute();
    } else if(name == 'ok') {
    } else if(name == 'power') {
        this.switchPower();
    } else if(name == 'up') {
    } else if(name == 'left') {
    } else if(name == 'right') {
    }
}

//----------------------------------------------------------------------------------------------

GodsPlayer.prototype.updateVolume = function(vol) {
    this.config.volume = vol;
    this.slider.css('width', (this.config.volume * 150.0)+'px');
    this.player.setVolume(this.config.mute? 0 : this.config.volume);
}

//----------------------------------------------------------------------------------------------

GodsPlayer.prototype.endMove = function(ev) {
    //deb("END MOVE!"+ ev.pageX+' xx '+ this.volume_slot.offset().left);
    var pos = Math.round((ev.pageX - this.volume_slot.offset().left)/15);
    var volume = pos /10.0;
    if(volume < 0) volume = 0; else if (volume > 1) volume = 1;
    this.updateVolume(volume);
}

//----------------------------------------------------------------------------------------------

// parseUri 1.2.2
// (c) Steven Levithan <stevenlevithan.com>
// MIT License

function parseUri (str) {
	var	o   = parseUri.options,
		m   = o.parser[o.strictMode ? "strict" : "loose"].exec(str),
		uri = {},
		i   = 14;

	while (i--) uri[o.key[i]] = m[i] || "";

	uri[o.q.name] = {};
	uri[o.key[12]].replace(o.q.parser, function ($0, $1, $2) {
		if ($1) uri[o.q.name][$1] = $2;
	});

	return uri;
};

parseUri.options = {
	strictMode: false,
	key: ["source","protocol","authority","userInfo","user","password","host","port","relative","path","directory","file","query","anchor"],
	q:   {
		name:   "queryKey",
		parser: /(?:^|&)([^&=]*)=?([^&]*)/g
	},
	parser: {
		strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
		loose:  /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
	}
};

//----------------------------------------------------------------------------------------------

function UrlProvider(display) {
  this._urls = [];
  this._primaryUrls = [];
  this._secondaryUrls = [];
  this.currentUrl = null;
  this.display = display;
}

UrlProvider.prototype.normalizeUrl = function(url) {
  deb("*** NORMALIZING URL: "+url);
  var x = parseUri(url);
  url = x.protocol+'://'+x.host+':'+(x.port? x.port : '80')+x.relative;
  deb("*** URL NORMALIZED TO: "+url);
  return url;
}

UrlProvider.prototype.reset = function(primaryUrls, secondaryUrls) {
  if(primaryUrls == undefined || primaryUrls == null)
    alert("UrlProvider: primary urls undefined");
  this._primaryUrls = primaryUrls instanceof Array? primaryUrls : [primaryUrls];
  for(var i = 0; i < this._primaryUrls.length; i++)
    this._primaryUrls[i] = this.normalizeUrl(this._primaryUrls[i]);
  if(secondaryUrls == undefined)
    this._secondaryUrls = this._primaryUrls;
  else
    this._secondaryUrls = secondaryUrls instanceof Array? secondaryUrls : [secondaryUrls];
    for(var i = 0; i < this._secondaryUrls.length; i++)
      this._secondaryUrls[i] = this.normalizeUrl(this._secondaryUrls[i]);
  this._urls = [];
  var currentIndex = Math.floor(Math.random() * this._primaryUrls.length);
  this.currentUrl = this._primaryUrls[currentIndex];
}

UrlProvider.prototype.getNextUrl = function() {
  deb("UrlProvider: ERROR RETRIEVING URL "+this.currentUrl);
  if(this._urls.length == 0)
    this._urls = this._secondaryUrls.slice();
  var currentIndex = Math.floor(Math.random() * this._urls.length);
  this.currentUrl = this._urls[currentIndex];
  this._urls.splice(currentIndex, 1);
  deb("UrlProvider: next URL is "+this.currentUrl);
  this.display.showMessage("TRY TO CONNECT", "");
  return this.currentUrl;
}

UrlProvider.prototype.connected = function() {
  this.display.showMessage("","");
}

//----------------------------------------------------------------------------------------------

function Player(domain, config, urlProvider) {
  if(urlProvider == undefined || urlProvider == null)
    alert("Player: bad urlProvider");
  this._volume = 0.70;
  this.audio1 = $('<div class="player1"></div>');
  this.audio2 = $('<div class="player2"></div>');
  this.audio = this.audio2;
  domain.append(this.audio1, this.audio2);
  this.reconnect_timer_hnd = null;
  this.urlProvider = urlProvider;
  this.streamformat = config.streamFormat;
  this.introUrl = config.introUrl == undefined? null : config.introUrl;
  this.connectionTimeout = config.connectionTimeout == undefined? 5.0 : config.connectionTimeout;
  this.timerHnd = null;
}

Player.prototype._clearTimeout = function() {
  if(this.timerHnd != null) clearTimeout(this.timerHnd);
  this.timerHnd = null;
};

Player.prototype._setTimeout = function() {
  this._clearTimeout();
  var me = this;
  this.timerHnd = setTimeout(function() {
    deb("*** CONNECTION TIMEOUT!");
    me.onError(null);
  }, this.connectionTimeout * 1000);
};

Player.prototype.setMute = function(v){
  deb('MUTED = '+v);
  this.audio.jPlayer('mute',v);
};

Player.prototype.getMute = function(){
  return this.audio.jPlayer('mute');
};

Player.prototype.setVolume = function(v){
  deb('VOLUME = '+v);
  this._volume = v;
  // TODO FIXME: should call _setTimeout()?
  this.audio.jPlayer('play');
  this.audio.jPlayer('volume',v);
};

Player.prototype.getVolume = function(){
  return this._volume;
};

Player.prototype.create = function() {
  this._clearTimeout();
  this.reconnect_timer_hnd = null;
  var me = this;
  var audio = this.audio == this.audio2? this.audio1 : this.audio2;
  var audioOld = this.audio == this.audio1? this.audio1 : this.audio2;
  //audioOld.jPlayer('destroy');
  this.audio = audio;
  deb('Creating player instance '+ (this.audio == this.audio1? '1' : '2')+' as '+this.streamformat+' stream; VOLUME='+this._volume);
  var supplied = this.streamformat;
  if(supplied == 'ogg') supplied = 'oga';
  this.audio.jPlayer({
        ready: function (event) {
          deb("jPlayer: ready");
          var ev = event.jPlayer.html.used ? $.jPlayer.event.playing : $.jPlayer.event.play;
          var url = me.introUrl? me.introUrl : me.urlProvider.currentUrl;
          me.introUrl = null;
          deb("Using event " + ev);
          $(this).unbind(ev).bind(ev, function(event) {
            deb("- EVENT: ", event);
            deb('Destroying player instance '+ (audioOld == me.audio1? '1' : '2'));
            audioOld.jPlayer('destroy');
          });
          deb("Loading URL: "+url+", format = "+me.streamformat);
          if(me.streamformat == 'ogg') {
            $(this).jPlayer(
              "setMedia", {'oga': url}).jPlayer(
              'play');
          } else if(me.streamformat == 'm4a') {
            $(this).jPlayer(
              "setMedia", {'m4a': url}).jPlayer(
              'play');
          } else if(me.streamformat == 'flv') {
            $(this).jPlayer(
              "setMedia", {'flv': url}).jPlayer(
              'play');
          } else
            $(this).jPlayer(
              "setMedia", {'mp3': url}).jPlayer(
              'play');
          me._setTimeout();
        },
        swfPath: installUrl,
        supplied: supplied,
        wmode: "window",
        //emulateHtml: true,
        //solution: "flash,html",
        volume: me._volume
  });

  audio.unbind($.jPlayer.event.loadedmetadata).bind($.jPlayer.event.loadedmetadata, function (event) {
    deb("- METADATA EVENT: ", event);
    me.onBuffer(event);
  });
  this.audio.unbind($.jPlayer.event.abort).bind($.jPlayer.event.abort, function(event) {
    deb("- ABORT EVENT: ", event);
  });
  this.audio.unbind($.jPlayer.event.emptied).bind($.jPlayer.event.emptied, function(event) {
    deb("- EMPTIED EVENT: ", event);
  });
  this.audio.unbind($.jPlayer.event.stalled).bind($.jPlayer.event.stalled, function(event) {
    deb("- STALLED EVENT: ", event);
  });
  audio.unbind($.jPlayer.event.loadstart)
       .bind($.jPlayer.event.loadstart, function(event) {me.onBuffer(event);});
  audio.unbind($.jPlayer.event.ended)
       .bind($.jPlayer.event.ended, function(event) { me.onError(event); });
  audio.unbind($.jPlayer.event.error+'.myProject')
       .bind($.jPlayer.event.error+'.myProject', function(event) {me.onError(event);});
  if(!isMobile)
    this.willRecreate(40*60000);
};

Player.prototype.play = function() {
  this._setTimeout();
  deb('PLAY');
  this.reconnect_timer_hnd = null;
  deb('Player.play() called!');
  this.audio.jPlayer('play');
};

Player.prototype.stop = function() {
  this._clearTimeout();
  deb('STOP');
  this.audio.jPlayer('stop');
};

Player.prototype.destroy = function() {
  this._clearTimeout();
  deb('DESTROY');
  this.audio1.jPlayer('destroy');
  this.audio2.jPlayer('destroy');
  if(this.reconnect_timer_hnd) {
    clearTimeout(this.reconnect_timer_hnd);
    this.reconnect_timer_hnd = null;
  }
};

Player.prototype.willRecreate = function(ms) {
  deb((this.audio == this.audio1? '1':'2')+'.willRecreate('+ms+')');
  if(this.reconnect_timer_hnd) clearTimeout(this.reconnect_timer_hnd);
  var player = this;
  this.reconnect_timer_hnd = setTimeout(function() {
    deb("willRecreate called.");
    player.create();
  }, ms);
};

Player.prototype.onBuffer = function(event) {
    deb("- LOADSTART EVENT: ", event);
    this._clearTimeout();
    this.urlProvider.connected();
};

Player.prototype.onError = function(event) {
    deb("- ERROR EVENT: ", event);
    this._clearTimeout();
    this.audio1.jPlayer('destroy');
    this.audio2.jPlayer('destroy');

    //if(event != null && event.jPlayer.error.type == 'e_url') {
      //alert("bad url: " + me.url);
      //return; // The actual error code string. Eg., "e_url" for $.jPlayer.error.URL error.
    //}
    if(event != null)
      deb("*** JPLAYER ERROR EVENT: "+ event.jPlayer.error.type);
    if(event != null && event.jPlayer.error.type == $.jPlayer.error.NO_SOLUTION)
     alert("Please install or upgrade Flash Player plugin (v10+ required).");
    // the following may be raised event when support+solution is ok (ff+mp3), could be due to timing issues :/
    //else if(event.jPlayer.error.type == $.jPlayer.error.NO_SUPPORT)
    // alert("Stream cannot be played on your system.");

    this.urlProvider.getNextUrl();
    this.willRecreate(1000);
};

// Plays aac+ and flv (with or without aac+)

function AACPlusPlayer(domain, config, urlProvider) {
  this.urlProvider = urlProvider;
  this.jwPlayerUrl = config.jwPlayerUrl == undefined? installUrl+'jwplayer.swf' : config.jwPlayerUrl;
  this._volume = 0.70;
  var audio_id = domain.attr('id');
  if(!audio_id) alert('GodsPlayer element must have an id set');
  var player = $('<div id="instance-'+audio_id+'"></div>');
  domain.append(player);
  this.audio = 'instance-'+audio_id;
  this.isPlaying = false;
  this.streamFormat = config.streamFormat;
  this.connectionTimeout = config.connectionTimeout == undefined? 8.0 : config.connectionTimeout;
  this.timerHnd = null;
  this.connected = false;
}

AACPlusPlayer.prototype._clearTimeout = function() {
  //deb("*** RESETTING CONNECTION TIMEOUT");
  if(this.timerHnd != null) clearTimeout(this.timerHnd);
  this.timerHnd = null;
};

AACPlusPlayer.prototype._setTimeout = function() {
  this._clearTimeout();
  var me = this;
  //deb("*** SETTING CONNECTION TIMEOUT");
  this.timerHnd = setTimeout(function() {
    deb("*** CONNECTION TIMEOUT!");
    me.onError(null);
  }, this.connectionTimeout * 1000);
};

AACPlusPlayer.prototype.setMute = function(v){
  deb('SET MUTE = ', v);
  jwplayer(this.audio).setMute(v);
};

AACPlusPlayer.prototype.getMute = function(){
  return jwplayer(this.audio).getMute();
};

AACPlusPlayer.prototype.setVolume = function(v){
  this._volume = v;
  deb("SET VOLUME: " + this.audio +" = " + v*100);
  if(this.isPlaying)
    jwplayer(this.audio).setVolume(v*100);
};

AACPlusPlayer.prototype.getVolume = function(){
  return this._volume;
};

AACPlusPlayer.prototype.create = function() {
  this.connected = false;
  var url = this.urlProvider.currentUrl;
  //url = url.replace('http://', 'socket://');
  deb('Creating aac+ player on '+this.audio+'; VOLUME='+this._volume+'; URL='+url);
  var me = this;
  var jwPlayerUrl = this.jwPlayerUrl;
  if(jwPlayerUrl.indexOf("/") == 0) {
    // use url from stream dst + jwPlayerUrl
    jwPlayerUrl = 'http://'+url.split('/')[2].split(':')[0]+jwPlayerUrl;
  }

  if(this.streamFormat == 'flv')
    url += '?type=.flv';
  jwplayer(this.audio).setup({
//    'modes': [
//        {type: 'html5'},
//        {type: 'flash', src: me.jwPlayerUrl}/ FIXME! path deve essere nel server che manda lo stream!
//    ],
    'flashplayer': jwPlayerUrl, // FIXME! path deve essere nel server che manda lo stream!
    'provider': me.streamFormat == 'flv'? 'http' : installUrl+'shoutcast.swf',
    'autostart': false, //me.streamFormat == 'flv',
    'width': '1',
    'height': '1',
    'file': url
  });
  jwplayer(this.audio).onError(function(e) {me.onError(e);});
  if(this.streamFormat == 'flv')
    jwplayer(this.audio).onBufferFull(function(e) {me.onBuffer(e)});
  else
    jwplayer(this.audio).onTime(function(e) {me.onTime(e)});
};

AACPlusPlayer.prototype.play = function() {
  this._setTimeout();
  deb('PLAY! '+this.audio);
  this.isPlaying = true;
  jwplayer(this.audio).play(true);
  jwplayer(this.audio).setVolume(this._volume*100);
};

AACPlusPlayer.prototype.stop = function() {
  this._clearTimeout();
  deb('STOP!');
  this.isPlaying = false;
  jwplayer(this.audio).remove();
  this.create();
};

AACPlusPlayer.prototype.destroy = function() {
  this._clearTimeout();
  deb('STOP! (DESTROY)');
  if(this.isPlaying) {
      jwplayer(this.audio).remove();
      this.create();
  }
  this.isPlaying = false;
};

AACPlusPlayer.prototype.willRecreate = function(ms) {
  this.play();
};

AACPlusPlayer.prototype.onError = function(event) {
  this.urlProvider.getNextUrl();
  this.stop();
  this.play();
};

AACPlusPlayer.prototype.onBuffer = function(event) {
  this._clearTimeout();
  deb("CONNECTED");
  this.connected = true;
  this.urlProvider.connected();
};


AACPlusPlayer.prototype.onTime = function(event) {
  this._setTimeout();
  if(!this.connected) {
    deb("CONNECTED");
    this.connected = true;
    this.urlProvider.connected();
  }
};



