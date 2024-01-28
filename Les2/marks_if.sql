SELECT total_marks, grade,
IF (total_marks > 450, "Отлично", "Хорошо")
AS estimation
FROM marks;