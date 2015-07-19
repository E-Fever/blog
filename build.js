var metalsmith = require('metalsmith');

var siteBuild = metalsmith(__dirname)
    .metadata({
      site: {
        title: 'E-Fever',
        url: 'https://e-fever.github.io'
      }
    })
    .source('./src')
    .destination('./build')
    .build(function (err) {
      if (err) {
        console.log(err);
      }
      else {
        console.log('Site build complete!');
      }
    });
