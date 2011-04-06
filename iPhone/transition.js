/**
 * TODO
 * 
 * author SNM
 * 
 * License MIT
 */

/**
 * 
 * @constructor
 */
function Transition() {
}


Transition.prototype.initTransition = function() {
	PhoneGap.exec("Transition.initTransition");
}

/**
 * Show loading view.
 */
Transition.prototype.showLoadingView = function() {
	PhoneGap.exec("Transition.showLoadingView");
};

/**
 * Hide loading view.
 */
Transition.prototype.hideLoadingView = function() {
    PhoneGap.exec("Transition.hideLoadingView");
};


PhoneGap.addConstructor(function() {
	if(!window.plugins) {
		window.plugins = {};
	}
	window.plugins.transition = new Transition();
});

