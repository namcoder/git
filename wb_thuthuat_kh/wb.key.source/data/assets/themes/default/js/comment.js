if ($("#system_comments").length) {
    $(document).on('click', '.comment_reply', function () {
        $(this).parents('.comment-box:first').children('.comment-footer:first').show();
        return false;
    });
    $(document).on('click', '.comment_reply_close', function () {
        $(this).parents('.comment-footer:first').hide();
    });

    $(document).on('click', '.more_comment', function () {
        return false;
    });
    var CommentRender = new Vue({
        el: '#system_comments',
        data: {
            name: '',
            email: '',
            commentable_type: '',
            commentable_id: '',
            censorship: '',
            limit: 5,
            comments: [],
            errors: '',
            end: false
        },
        created: function () {
            this.commentable_type = $('#system_comments').data('commentable_type');
            this.commentable_id = $('#system_comments').data('commentable_id');
            this.censorship = $('#system_comments').data('censorship');
        },
        mounted: function () {
            this.load();
        },
        methods: {
            more: function () {
                if (!this.end) {
                    this.limit += 5;
                    this.load();
                }
            },

            submit: function (e) {
                e.preventDefault();
                this.name = this.name !== '' ? this.name : e.target.elements.name.value;
                this.email = this.email !== '' ? this.email : e.target.elements.email.value;

                var data = {};
                data.name = this.name;
                data.email = this.email;
                data.content = e.target.elements.content.value;
                e.target.elements.content.value = '';

                data.parent_id = e.target.elements.parent_id.value;
                data.commentable_type = this.commentable_type;
                data.commentable_id = this.commentable_id;
                data.censorship = this.censorship;

                if (data.name != '' && data.email != '' && data.content != '') {
                    this.errors = '';
                    let _this = this;
                    $.post(
                        '/submit-comment', // url, usually use the form action attribute here
                        data, // data, usually use form data here
                        function (data, status, request) {
                            _this.load();
                            // no idea how I append data to a div using vue.js?
                        }
                    );
                } else {
                    this.errors = 'Bạn vui lòng nhập đầy đủ thông tin!';
                }
            },

            load: function () {
                let _this = this;
                var data = {
                    commentable_type: this.commentable_type,
                    commentable_id: this.commentable_id,
                    limit: this.limit
                };
                $.get(
                    '/load-comment', // url, usually use the form action attribute here
                    data, // data, usually use form data here
                    function (data, status, request) {
                        // no idea how I append data to a div using vue.js?
                        _this.comments = data;

                        if (_this.limit > _this.comments.length) {
                            _this.end = true;
                        } else {
                            _this.end = false;
                        }
                    }
                );
            }
        }
    });
}