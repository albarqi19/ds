Write-Host "🚀 بدء اختبار API..." -ForegroundColor Yellow

$headers = @{'Content-Type' = 'application/json'}
$sessionData = @{
    student_id = 1
    teacher_id = 2
    quran_circle_id = 1
    start_surah_number = 2
    start_verse = 1
    end_surah_number = 2
    end_verse = 5
    recitation_type = "مراجعة صغرى"
    grade = 7.5
    evaluation = "جيد جدا"
    teacher_notes = "اختبار PowerShell API"
} | ConvertTo-Json

try {
    $result = Invoke-RestMethod -Uri "http://localhost:8000/api/recitation/sessions" -Method POST -Headers $headers -Body $sessionData
    Write-Host "✅ نجح إنشاء الجلسة!" -ForegroundColor Green
    $result | ConvertTo-Json -Depth 3 | Out-File "api_test_result.txt"
    Write-Host "تم حفظ النتيجة في api_test_result.txt" -ForegroundColor Cyan
    $result.data.session_id
} catch {
    Write-Host "❌ خطأ: $($_.Exception.Message)" -ForegroundColor Red
    $_.ErrorDetails.Message | Out-File "api_test_error.txt"
}
