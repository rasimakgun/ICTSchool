-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2020 at 07:22 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `icts`
--

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `permission_name`, `permission_group`, `created_at`, `updated_at`, `permission_type`) VALUES
(1, 'student_view', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(2, 'student_add', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(3, 'student_update', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(4, 'student_delete', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(5, 'student_info', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(6, 'student_student_portal_access', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(7, 'student_student_bulk_add', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(8, 'add_student_attendance', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(9, 'view_student_attendance', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(10, 'view_student_monthly_reports', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(11, 'family', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(12, 'add_marks', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(13, 'view_marks', 'admin', '2020-05-14 05:16:57', '2020-05-14 05:16:57', 'yes'),
(14, 'delete_marks', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(15, 'generate_result', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(16, 'search_result', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(17, 'promote_student', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(18, 'view_result_reports', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(19, 'view_attendance_reports', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(20, 'view_sms/voice_log_reports', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(21, 'class_view', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(22, 'class_add', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(23, 'class_update', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(24, 'class_delete', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(25, 'section_view', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(26, 'section_add', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(27, 'section_update', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(28, 'section_delete', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(29, 'section_time_table', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(30, 'teacher_view', 'admin', '2020-05-14 05:16:58', '2020-05-14 05:16:58', 'yes'),
(31, 'teacher_add', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(32, 'teacher_bulk_add', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(33, 'teacher_update', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(34, 'teacher_delete', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(35, 'teacher_timetable_add', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(36, 'teacher_timetable_view', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(37, 'teacher_portal_access', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(38, 'send_sms/voice', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(39, 'setting_gpa_rule_view', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(40, 'gpa_rule_add', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(41, 'gpa_rule_update', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(42, 'gpa_rule_delete', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(43, 'gpa_rule_view', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(44, 'holidays_add', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(45, 'holidays_view', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(46, 'holidays_delete', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(47, 'class_off_view', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(48, 'class_off_add', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(49, 'class_off_delete', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(50, 'institute_information_add', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(51, 'grade_system_(auto,manual)', 'admin', '2020-05-14 05:16:59', '2020-05-14 05:16:59', 'yes'),
(52, 'subject_view', 'admin', '2020-05-14 05:17:00', '2020-05-14 05:17:00', 'yes'),
(53, 'subject_add', 'admin', '2020-05-14 05:17:00', '2020-05-14 05:17:00', 'yes'),
(54, 'subject_update', 'admin', '2020-05-14 05:17:00', '2020-05-14 05:17:00', 'yes'),
(55, 'subject_delete', 'admin', '2020-05-14 05:17:00', '2020-05-14 05:17:00', 'yes'),
(56, 'exam_view', 'admin', '2020-05-14 05:17:00', '2020-05-14 05:17:00', 'yes'),
(57, 'exam_add', 'admin', '2020-05-14 05:17:00', '2020-05-14 05:17:00', 'yes'),
(58, 'exam_update', 'admin', '2020-05-14 05:17:00', '2020-05-14 05:17:00', 'yes'),
(59, 'exam_delete', 'admin', '2020-05-14 05:17:00', '2020-05-14 05:17:00', 'yes'),
(60, 'gradesheet_view', 'admin', '2020-05-14 05:17:00', '2020-05-14 05:17:00', 'yes'),
(61, 'gradesheet_print', 'admin', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'yes'),
(62, 'send_notification', 'admin', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'yes'),
(63, 'paper_view', 'admin', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'yes'),
(64, 'paper_add', 'admin', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'yes'),
(65, 'paper_update', 'admin', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'yes'),
(66, 'paper_delete', 'admin', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'yes'),
(67, 'student_view', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(68, 'student_add', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(69, 'student_update', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(70, 'student_delete', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(71, 'student_info', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(72, 'student_student_portal_access', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(73, 'student_student_bulk_add', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(74, 'add_student_attendance', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(75, 'view_student_attendance', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(76, 'view_student_monthly_reports', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(77, 'family', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(78, 'add_marks', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(79, 'view_marks', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(80, 'delete_marks', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(81, 'generate_result', 'student', '2020-05-14 05:17:01', '2020-05-14 05:17:01', 'no'),
(82, 'search_result', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(83, 'promote_student', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(84, 'view_result_reports', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(85, 'view_attendance_reports', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(86, 'view_sms/voice_log_reports', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(87, 'class_view', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(88, 'class_add', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(89, 'class_update', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(90, 'class_delete', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(91, 'section_view', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(92, 'section_add', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(93, 'section_update', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(94, 'section_delete', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(95, 'section_time_table', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(96, 'teacher_view', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(97, 'teacher_add', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(98, 'teacher_bulk_add', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(99, 'teacher_update', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(100, 'teacher_delete', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(101, 'teacher_timetable_add', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(102, 'teacher_timetable_view', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(103, 'teacher_portal_access', 'student', '2020-05-14 05:17:02', '2020-05-14 05:17:02', 'no'),
(104, 'send_sms/voice', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(105, 'setting_gpa_rule_view', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(106, 'gpa_rule_add', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(107, 'gpa_rule_update', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(108, 'gpa_rule_delete', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(109, 'gpa_rule_view', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(110, 'holidays_add', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(111, 'holidays_view', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(112, 'holidays_delete', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(113, 'class_off_view', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(114, 'class_off_add', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(115, 'class_off_delete', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(116, 'institute_information_add', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(117, 'grade_system_(auto,manual)', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(118, 'subject_view', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(119, 'subject_add', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(120, 'subject_update', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(121, 'subject_delete', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(122, 'exam_view', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(123, 'exam_add', 'student', '2020-05-14 05:17:03', '2020-05-14 05:17:03', 'no'),
(124, 'exam_update', 'student', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(125, 'exam_delete', 'student', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(126, 'gradesheet_view', 'student', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(127, 'gradesheet_print', 'student', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(128, 'send_notification', 'student', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(129, 'paper_view', 'student', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(130, 'paper_add', 'student', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(131, 'paper_update', 'student', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(132, 'paper_delete', 'student', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(133, 'student_view', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(134, 'student_add', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(135, 'student_update', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(136, 'student_delete', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(137, 'student_info', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(138, 'student_student_portal_access', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(139, 'student_student_bulk_add', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(140, 'add_student_attendance', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(141, 'view_student_attendance', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(142, 'view_student_monthly_reports', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(143, 'family', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(144, 'add_marks', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(145, 'view_marks', 'teacher', '2020-05-14 05:17:04', '2020-05-14 05:17:04', 'no'),
(146, 'delete_marks', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(147, 'generate_result', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(148, 'search_result', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(149, 'promote_student', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(150, 'view_result_reports', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(151, 'view_attendance_reports', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(152, 'view_sms/voice_log_reports', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(153, 'class_view', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(154, 'class_add', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(155, 'class_update', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(156, 'class_delete', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(157, 'section_view', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(158, 'section_add', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(159, 'section_update', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(160, 'section_delete', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(161, 'section_time_table', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(162, 'teacher_view', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(163, 'teacher_add', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(164, 'teacher_bulk_add', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(165, 'teacher_update', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(166, 'teacher_delete', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(167, 'teacher_timetable_add', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(168, 'teacher_timetable_view', 'teacher', '2020-05-14 05:17:05', '2020-05-14 05:17:05', 'no'),
(169, 'teacher_portal_access', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(170, 'send_sms/voice', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(171, 'setting_gpa_rule_view', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(172, 'gpa_rule_add', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(173, 'gpa_rule_update', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(174, 'gpa_rule_delete', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(175, 'gpa_rule_view', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(176, 'holidays_add', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(177, 'holidays_view', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(178, 'holidays_delete', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(179, 'class_off_view', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(180, 'class_off_add', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(181, 'class_off_delete', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(182, 'institute_information_add', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(183, 'grade_system_(auto,manual)', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(184, 'subject_view', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(185, 'subject_add', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(186, 'subject_update', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(187, 'subject_delete', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(188, 'exam_view', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(189, 'exam_add', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(190, 'exam_update', 'teacher', '2020-05-14 05:17:06', '2020-05-14 05:17:06', 'no'),
(191, 'exam_delete', 'teacher', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(192, 'gradesheet_view', 'teacher', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(193, 'gradesheet_print', 'teacher', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(194, 'send_notification', 'teacher', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(195, 'paper_view', 'teacher', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(196, 'paper_add', 'teacher', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(197, 'paper_update', 'teacher', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(198, 'paper_delete', 'teacher', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(199, 'student_view', 'accountant', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(200, 'student_add', 'accountant', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(201, 'student_update', 'accountant', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(202, 'student_delete', 'accountant', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(203, 'student_info', 'accountant', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(204, 'student_student_portal_access', 'accountant', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(205, 'student_student_bulk_add', 'accountant', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(206, 'add_student_attendance', 'accountant', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(207, 'view_student_attendance', 'accountant', '2020-05-14 05:17:07', '2020-05-14 05:17:07', 'no'),
(208, 'view_student_monthly_reports', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(209, 'family', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(210, 'add_marks', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(211, 'view_marks', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(212, 'delete_marks', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(213, 'generate_result', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(214, 'search_result', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(215, 'promote_student', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(216, 'view_result_reports', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(217, 'view_attendance_reports', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(218, 'view_sms/voice_log_reports', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(219, 'class_view', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(220, 'class_add', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(221, 'class_update', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(222, 'class_delete', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(223, 'section_view', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(224, 'section_add', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(225, 'section_update', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(226, 'section_delete', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(227, 'section_time_table', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(228, 'teacher_view', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(229, 'teacher_add', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(230, 'teacher_bulk_add', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(231, 'teacher_update', 'accountant', '2020-05-14 05:17:08', '2020-05-14 05:17:08', 'no'),
(232, 'teacher_delete', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(233, 'teacher_timetable_add', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(234, 'teacher_timetable_view', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(235, 'teacher_portal_access', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(236, 'send_sms/voice', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(237, 'setting_gpa_rule_view', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(238, 'gpa_rule_add', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(239, 'gpa_rule_update', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(240, 'gpa_rule_delete', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(241, 'gpa_rule_view', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(242, 'holidays_add', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(243, 'holidays_view', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(244, 'holidays_delete', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(245, 'class_off_view', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(246, 'class_off_add', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(247, 'class_off_delete', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(248, 'institute_information_add', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(249, 'grade_system_(auto,manual)', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(250, 'subject_view', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(251, 'subject_add', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(252, 'subject_update', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(253, 'subject_delete', 'accountant', '2020-05-14 05:17:09', '2020-05-14 05:17:09', 'no'),
(254, 'exam_view', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no'),
(255, 'exam_add', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no'),
(256, 'exam_update', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no'),
(257, 'exam_delete', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no'),
(258, 'gradesheet_view', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no'),
(259, 'gradesheet_print', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no'),
(260, 'send_notification', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no'),
(261, 'paper_view', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no'),
(262, 'paper_add', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no'),
(263, 'paper_update', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no'),
(264, 'paper_delete', 'accountant', '2020-05-14 05:17:10', '2020-05-14 05:17:10', 'no');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
