document.addEventListener("DOMContentLoaded", function () {
	// Mặc định hiển thị thông tin của Vietcombank
	const vcbBank = document.getElementById("bank-vietcombank");
	const vcbInfo = document.getElementById("pay_info-vietcombank");
	const bidvBank = document.getElementById("bank-bidv");
	const bidvInfo = document.getElementById("pay_info-bidv");

	if (vcbBank) vcbBank.style.borderColor = "var(--primary-color-1)";
	if (vcbInfo) vcbInfo.style.display = "block";
	if (bidvInfo) bidvInfo.style.display = "none";

	// Xử lý sự kiện khi chọn Vietcombank
	if (vcbBank) {
		vcbBank.addEventListener("click", function () {
			if (vcbInfo) vcbInfo.style.display = "block";
			if (bidvInfo) bidvInfo.style.display = "none";
			vcbBank.style.borderColor = "var(--primary-color-1)";
			if (bidvBank) bidvBank.style.borderColor = "var(--outline-gray)";
		});
	}

	// Xử lý sự kiện khi chọn BIDV
	if (bidvBank) {
		bidvBank.addEventListener("click", function () {
			if (vcbInfo) vcbInfo.style.display = "none";
			if (bidvInfo) bidvInfo.style.display = "block";
			bidvBank.style.borderColor = "var(--primary-color-1)";
			if (vcbBank) vcbBank.style.borderColor = "var(--outline-gray)";
		});
	}

	// Thêm xử lý sự kiện khi nhấn nút Xác nhận
	const submitBtn = document.getElementById("btn-submit");
	if (submitBtn) {
		submitBtn.addEventListener("click", function () {
			alert("Xác nhận đơn hàng thành công!");
		});
	}

	// Thêm xử lý sự kiện khi nhấn nút Trở lại trang chủ
});    