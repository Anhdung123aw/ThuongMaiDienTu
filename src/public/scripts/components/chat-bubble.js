(function () {
    const trigger = document.getElementById('chatBubbleTrigger');
    const options = document.getElementById('chatBubbleOptions');
    const container = document.querySelector('.chat-bubble-container');

    if (trigger && options) {
        // Toggle the options active state
        trigger.addEventListener('click', function (e) {
            e.stopPropagation();
            trigger.classList.toggle('active');
            options.classList.toggle('active');
        });

        // Close options when clicking anywhere outside the chat bubble container
        document.addEventListener('click', function (e) {
            if (container && !container.contains(e.target)) {
                trigger.classList.remove('active');
                options.classList.remove('active');
            }
        });

        // Add a slight entry delay to make it pop into view nicely after page load
        container.style.opacity = '0';
        container.style.transform = 'translateY(50px)';
        container.style.transition = 'opacity 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275), transform 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275)';
        
        setTimeout(() => {
            container.style.opacity = '1';
            container.style.transform = 'translateY(0)';
        }, 300);
    }
})();
