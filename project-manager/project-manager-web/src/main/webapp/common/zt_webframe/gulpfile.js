var gulp = require('gulp'),
    sass = require('gulp-sass'),
    concat = require('gulp-concat'),
    minifycss = require('gulp-minify-css'),
    uglify = require('gulp-uglify'),
    rename = require('gulp-rename'),
    autoprefixer = require('gulp-autoprefixer');

/*默认的事件*/
gulp.task('default', ['sass', 'scripts']);
/*
*css文件编译
*/
gulp.task('sass', function() {
    gulp.src('./src/scss/*.scss') //匹配文件
    .pipe(sass({                       //sass模块编译
        outputStyle: 'expanded'        //分行显示
        //outputStyle: 'compressed'    //代码压缩
    }).on('error', sass.logError))
    .pipe(gulp.dest('./dist/css'))     //输出一份到dist/css目录
    .pipe(minifycss())                 //继续压缩一份
    .pipe(rename({suffix: '.min'}))    //重命名避免覆盖上一次的输出
    .pipe(gulp.dest('./dist/css'));    //输出压缩好的新css文件
});
/*
*JS文件编译
*/
gulp.task('scripts', function() {
    gulp.src('./src/js/*.js')
    .pipe(uglify())                 //压缩一份
    .pipe(rename({suffix: '.min'})) //把所有的文件都添加.min.js后缀
    .pipe(gulp.dest('./dist/js'))
    .pipe(concat('app.js'))         // 合并为一个文件
    .pipe(gulp.dest('./dist/js'))   // 写入一份到指定目录
    .pipe(uglify())                 // 压缩一份
    .pipe(rename("buldle.min.js"))  // 并重命名以防覆盖上次写入的文件
    .pipe(gulp.dest('./dist/js'));  // 写入到指定目录
});
/*
**监听任务执行
*/
/*gulp.task('browserSync', function() {
  browserSync({
    server: {
      baseDir: 'app'
    },
  });
});*/

/*
***监听任务执行
*/
gulp.task('watcher', function() {
    gulp.watch("src/scss/**/*.scss", ['sass']);
    gulp.watch("src/js//**/*.js", ['scripts']);
});