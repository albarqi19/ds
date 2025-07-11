<?php

// استدعاء الملفات اللازمة
require __DIR__ . "/vendor/autoload.php";

$app = require_once __DIR__ . "/bootstrap/app.php";
$app->make("Illuminate\Contracts\Console\Kernel")->bootstrap();

// الاستعلام عن هيكل جدول التقييمات
$columns = DB::select("SHOW COLUMNS FROM teacher_evaluations");
echo "هيكل جدول teacher_evaluations:\n";
foreach ($columns as $column) {
    echo "- " . $column->Field . " (" . $column->Type . ")\n";
    if ($column->Field == "status") {
        echo "  القيم المسموحة: " . $column->Type . "\n";
    }
}

