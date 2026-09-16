window.Vimeo = window.Vimeo || {};
window.Vimeo.Player = window.Vimeo.Player || function(id, options) {
    this.id = id;
    this.element = typeof id === 'string' ? document.getElementById(id) : id;
    this.getVideoWidth = function() { return Promise.resolve(1920); };
    this.getVideoHeight = function() { return Promise.resolve(1080); };
    this.on = function(event, callback) { return this; };
    this.off = function(event, callback) { return this; };
    this.setVolume = function() { return Promise.resolve(); };
    this.play = function() { return Promise.resolve(); };
    this.pause = function() { return Promise.resolve(); };
    this.unload = function() { return Promise.resolve(); };
};