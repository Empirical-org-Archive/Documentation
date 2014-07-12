module.exports = function(grunt) {
  var conf = {
    shell: {
      nanoc: {
        command: 'nanoc', options: { stdout: true }
      }
    },

    watch: {
      files: ["content/**", "layouts/**", "lib/**", "contents/**", "config.yaml", "nanoc.yaml", "Rules"],
      tasks: ['shell']
    },

    concurrent: {
      server: {
        options: { logConcurrentOutput: true },
        tasks: ['watch', 'connect']
      }
    },

    connect: {
      server: {
        options: { base: 'output', port: 8080, keepalive: true }
      }
    }
  };

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-concurrent');
  grunt.loadNpmTasks('grunt-shell');
  grunt.initConfig(conf);
  grunt.registerTask('default', ['concurrent']);
};
