const appbarEle = document.querySelectorAll('.app-bar__element')
appbarEle[3].classList.add('active')

const allForm = document.querySelectorAll('.feedback-form-item');
allForm.forEach((form) => {
    const allStar = form.querySelectorAll('.rating .star')
    const ratingText = form.querySelector('.ratingText')

    allStar.forEach((item, idx) => {
        item.addEventListener('click', function (event) {
            let current = event.currentTarget
            let ratingInput = current.parentElement.querySelector('input')

            let click = 0
            ratingInput.value = idx % 5 + 1

            allStar.forEach(i => {
                i.classList.replace('bxs-star', 'bx-star')
                i.classList.remove('active')
            })

            for (let i = 0; i < allStar.length; i++) {
                if (i <= idx) {
                    allStar[i].classList.replace('bx-star', 'bxs-star')
                    allStar[i].classList.add('active')
                } else {
                    allStar[i].style.setProperty('--i', click)
                    click++
                }
            }

            // add status of rating stars
            switch (idx + 1) {
                case 1:
                    ratingText.textContent = 'Tệ'
                    break
                case 2:
                    ratingText.textContent = 'Không hài lòng'
                    break
                case 3:
                    ratingText.textContent = 'Bình thường'
                    break
                case 4:
                    ratingText.textContent = 'Hài lòng'
                    break
                case 5:
                    ratingText.textContent = 'Tuyệt vời'
                    break
                default:
                    ratingText.textContent = ''
            }
        })
    })
})


// Xử lý xem trước ảnh (Preview)
const imageUploads = document.querySelectorAll('.imageUpload')
imageUploads.forEach((input, index) => {
    input.addEventListener('change', function (e) {
        const previewContainer = document.getElementById(`imagePreview${index}`)
        previewContainer.innerHTML = '' // Xóa các preview cũ

        if (this.files && this.files[0]) {
            const reader = new FileReader()
            reader.onload = function (e) {
                const img = document.createElement('img')
                img.src = e.target.result
                previewContainer.appendChild(img)
            }
            reader.readAsDataURL(this.files[0])
        }
    })
})

// Fetch rating
const ratingForm = document.querySelector('.rating-form')
ratingForm.addEventListener('submit', submitRating)

function submitRating(event) {
    event.preventDefault()

    const formData = new FormData()
    const products = Array.from(ratingForm.querySelectorAll('.feedback-form-item'))

    const orderId = ratingForm.querySelector('input[name="order_id"]').value
    formData.append('order_id', orderId)

    products.forEach((product, index) => {
        let productVariantId = product.querySelector('input[name="product_variant_id"]').value
        let feedbackRate = product.querySelector('input[name="rating"]').value ?? 5
        let feedbackContent = product.querySelector('textarea').value
        let imageInput = product.querySelector('.imageUpload')

        // Gửi thông tin đánh giá dạng mảng trong FormData
        formData.append(`feedbacks[${index}][product_variant_id]`, productVariantId)
        formData.append(`feedbacks[${index}][feedback_rate]`, feedbackRate)
        formData.append(`feedbacks[${index}][feedback_content]`, feedbackContent)

        if (imageInput.files[0]) {
            formData.append(`image`, imageInput.files[0])
            formData.append(`feedbacks[${index}][has_image]`, 'true')
        } else {
            formData.append(`feedbacks[${index}][has_image]`, 'false')
        }
    })

    fetch('/account/feedback', {
        body: formData,
        method: 'POST',
        // Lưu ý: Không đặt Content-Type khi dùng FormData, trình duyệt sẽ tự xử lý kèm boundary
    })
        .then((response) => {
            if (response.ok) {
                const successModal = document.querySelector('.success-modal')
                successModal.style.display = 'flex'
                setTimeout(() => {
                    successModal.style.display = 'none'
                    window.location.href = '/account/purchase?order_status=Hoàn%20thành'
                }, 1000)
            } else {
                alert('Có lỗi xảy ra khi gửi đánh giá!')
            }
        })
        .catch(err => console.error('Lỗi:', err))
}
