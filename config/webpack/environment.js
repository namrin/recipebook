const { environment } = require('@rails/webpacker')
const webpack = require('webpack') /* To get Bootstrap working */
environment.plugins.append('Provide',
	new webpack.ProvidePlugin(
		{ $: 'jquery', 
		jQuery: 'jquery', 
		Popper: ['popper.js', 'default']
	})
)
module.exports = environment
