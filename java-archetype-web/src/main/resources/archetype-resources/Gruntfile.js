'use strict'

module.exports = function(grunt) {
	
	grunt.initConfig({
		dir: {
			assets: './src/main/webapp/assets',
			js: '<%= dir.assets %>/js',
			css: '<%= dir.assets %>/css',
		}, 
		pkg: grunt.file.readJSON('package.json'),

		concat: {
			js: {
				src: ['<%= dir.js %>/app/*.js'],
				dest: '<%= dir.js %>/app.js'
			},
			css: {
				src: ['<%= dir.css %>/app/*.css'],
				dest: '<%= dir.css %>/app.css'
			}
		},
		uglify: {
			app: {
				src: '<%= concat.js.dest %>',
				dest : '<%= dir.js %>/app.min.js'
			}
		},
		cssmin: {
			app: {
				src: '<%= concat.css.dest %>',
				dest: '<%= dir.css %>/app.min.css'
			}
		},
		watch: {
			js: {
				files: '<%= concat.js.src %>',
				tasks: ['concat:js', 'uglify']				
			},
			css: {
				files: '<%= concat.css.src %>',
				tasks: ['concat:css', 'cssmin']				
			}
		}
	});		

	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.loadNpmTasks('grunt-contrib-watch');

	grunt.registerTask('default', ['concat', 'uglify', 'cssmin']);
	
};
