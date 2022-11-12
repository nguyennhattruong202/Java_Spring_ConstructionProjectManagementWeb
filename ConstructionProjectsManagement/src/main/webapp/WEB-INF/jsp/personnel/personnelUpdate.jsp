<%-- 
    Document   : detailPersonnel
    Created on : Sep 27, 2022, 1:40:08 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .badge{
        background-color: #026aa7;
        color: #ffffff;
        border-radius: 0px;
    }
</style>
<c:url value="/admin" var="adminAction"/>

<div class="my-main-content-container">
    <form>
        <div class="d-flex justify-content-end my-tool-container">
            <a href="${adminAction}/personnel" id="aCancelPersonnelUpdate" class="my-button text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Thoát">
                <i class="fa-solid fa-arrow-left"></i>
            </a>
            <button id="buttonSavePersonnelUpdate" type="submit" class="my-button" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Lưu">
                <i class="fa-solid fa-floppy-disk"></i>
            </button>
            <a href="${adminAction}/personnel/${personnelById.id}/update" id="aResetPersonnelUpdate" class="my-button text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Làm lại">
                <i class="fa-solid fa-arrow-rotate-right"></i>
            </a>
        </div>
        <div class="my-titile-container">Cập nhật thông tin nhân sự</div>
        <div class="my-content-container">
            <div class="d-flex">
                <div>
                    <img class="img-fluid rounded-circle" style="height: 150px; width: 150px;" src="https://res.cloudinary.com/dgqmraoge/image/upload/v1662860612/photo-1438761681033-6461ffad8d80_vkpkbo.jpg" alt="avatarUser">
                </div>
                <div class="d-flex align-items-center" style="padding-left: 20px;">
                    <h3>Lê Trần Phương Nhi</h3>
                    <h6><span class="badge ms-3">ADMIN</span></h6>
                </div>
            </div>
            <hr>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">ID:</div>
                <div class="col">
                    <input type="number" class="form-control" disabled="true">
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">Họ và tên lót:</div>
                <div class="col">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">Tên:</div>
                <div class="col">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">Giới tính:</div>
                <div class="col">
                    <select class="form-select">
                        <option value="" disabled="true" selected="true">---Chọn---</option>
                        <option value="Nam">Nam</option>
                        <option value="Nữ">Nữ</option>
                    </select>
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">Ngày sinh:</div>
                <div class="col">
                    <input type="date" class="form-control">
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">CCCD/CMND:</div>
                <div class="col">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">Email:</div>
                <div class="col">
                    <input type="email" class="form-control">
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">Số điện thoại:</div>
                <div class="col">
                    <input type="tel" class="form-control">
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">Địa chỉ:</div>
                <div class="col">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">Chức vụ:</div>
                <div class="col">
                    <select class="form-select">
                        <option value="" disabled="true" selected="true">---Chọn---</option>
                    </select>
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">Phòng ban:</div>
                <div class="col">
                    <select class="form-select">
                        <option value="" disabled="true" selected="true">---Chọn---</option>
                    </select>
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-2 d-flex align-items-center">Role:</div>
                <div class="col">
                    <select class="form-select">
                        <option value="" disabled="true" selected="true">---Chọn---</option>
                        <option value="ROLE_ADMIN">ROLE_ADMIN</option>
                        <option value="ROLE_MANAGER">ROLE_MANAGER</option>
                        <option value="ROLE_STAFF">ROLE_STAFF</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-2 d-flex align-items-center">Hình ảnh:</div>
                <div class="col">
                    <input type="file" class="form-control">
                </div>
            </div>
        </div>
    </form>
</div>