# الأمر المصحح مع البيانات الصحيحة

# تعريف البيانات الصحيحة أولاً
$sessionData = @{
    student_id = 1
    teacher_id = 1
    quran_circle_id = 1
    start_surah_number = 1
    start_verse = 1
    end_surah_number = 1
    end_verse = 7
    recitation_type = "حفظ"
    duration_minutes = 30
    grade = 8.5
    evaluation = "جيد جداً"
    teacher_notes = "أداء جيد"
}; $jsonData = $sessionData | ConvertTo-Json; $baseUrl = "http://127.0.0.1:8000/api"; $headers = @{"Content-Type" = "application/json; charset=utf-8"; "Accept" = "application/json"}; Write-Host "إرسال طلب إنشاء الجلسة..." -ForegroundColor Yellow; try { $response = Invoke-RestMethod -Uri "$baseUrl/recitation/sessions" -Method POST -Body $jsonData -Headers $headers; Write-Host "✅ تم إنشاء الجلسة بنجاح!" -ForegroundColor Green; Write-Host "معرف الجلسة: $($response.session_id)" -ForegroundColor Cyan; $global:CreatedSessionId = $response.session_id } catch { Write-Host "❌ فشل إنشاء الجلسة:" -ForegroundColor Red; Write-Host "الخطأ: $($_.Exception.Message)" -ForegroundColor Yellow; if ($_.Exception.Response) { $reader = [System.IO.StreamReader]::new($_.Exception.Response.GetResponseStream()); $responseBody = $reader.ReadToEnd(); Write-Host "تفاصيل الخطأ: $responseBody" -ForegroundColor Magenta } }
