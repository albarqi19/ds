<?php
require_once 'vendor/autoload.php';
require_once 'bootstrap/app.php';

\ = app('db');
\ = \->select('SHOW COLUMNS FROM teacher_evaluations');
print_r(\);

// التحقق من قيم الإعداد المسموح بها لحقل status
\ = \->select('SHOW COLUMNS FROM teacher_evaluations WHERE Field = ?', ['status']);
echo '\\nقيم status المسموح بها:\\n';
print_r(\);

