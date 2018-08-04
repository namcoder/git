var WBSeoClass = function() {
    this.$checkSeoButton = null;
    this.$seoSlugInput = null;
    this.$seoDescriptionInput = null;
    this.$seoTitleInput = null;
    this.$titleInput = null;
    this.data = [];
    this.elements = {};
    this.page = 'detail';
    this.final_result = {
        total_score: 0,
    };
    this.checked = {
        seo_keyword : false,
        seo_title: false,
        seo_description: false,
        title: false,
        description: false,
        content: false,
    };
    this.$seoContainer = null;
};
WBSeoClass.prototype = {
    
    /*
     * Check seo
     */
    REGEX_SPLIT_KEYWORD: /[,;:!?.()\"\...]+/,
    REGEX_SPLIT_SENTENCE: /[,;!?.\n\...]+/,
    REGEX_SPLIT_WORD: /[\s,]+/,
    REGEX_REMOVE_SYMBOL: /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi,

    init: function(page, elements) {
        console.log(page);
        this.$checkSeoButton = this.getDefaultButton();
        this.elements = this.getDefaultElements();
        this.page = page;
        this.initElements();
        this.registerEvent();
        this.createTagInputForSeoKeyword();
    },

    initElements: function () {
        this.$seoContainer = $('[data-seo="seo_keyword"]').closest('.panel');
        this.$seoSlugInput = this.$seoContainer.find('input[data-seo="seo_slug"]');
        this.$seoTitleInput = this.$seoContainer.find('input[data-seo="seo_title"]');
        this.$seoDescriptionInput = this.$seoContainer.find('textarea[data-seo="seo_description"]');
        let titleInput = this.$seoSlugInput.attr('bs-slug-from');
        this.$titleInput = $('input[name=' + titleInput + ']');
    },

    registerEvent: function() {
        this.$checkSeoButton.on('click', $.proxy(this.clickCheckSeoBtn, this));
        this.$titleInput.on('input', $.proxy(this.blurTitleInput, this));
        this.$seoTitleInput.on('keyup', $.proxy(this.changeSeoTitle, this));
        this.$seoDescriptionInput.on('keyup', $.proxy(this.changeSeoDescription, this));
    },

    getElementData: function() {
        var _this = this;
        this.elements.forEach(function(element) {
            let $current_element = $('[data-seo="' + element.data_seo + '"]');
            let element_value = $current_element.val();
            if ($current_element.hasClass('ckeditor')) {
                let element_name = $current_element.attr('id');
                element_value = CKEDITOR.instances[element_name].getData();
            }
            _this.data.push({
                key: element.key,
                value: element_value
            });
        });
        this.data = _this.data;
    },

    getOriginalData: function (key) {
        for (var i = this.data.length - 1; i >= 0; i--) {
            if (this.data[i].key == key) {
                return this.data[i].value;
            }
        }
    },

    getNormalizedData: function (key) {
        let data = this.getOriginalData(key);
        return this.normalizeContent(data);
    },

    getFinalResult: function (key) {
        return this.final_result[key];
    },

    setFinalResult: function (key, value) {
        this.final_result[key] = value;
        if (value.score) {
            this.final_result.total_score += value.score;
        }
    },

    getDefaultElements: function() {
        return [{
            key: 'title',
            data_seo: 'title'
        }, {
            key: 'description',
            data_seo: 'description'
        }, {
            key: 'content',
            data_seo: 'content'
        }, {
            key: 'seo_title',
            data_seo: 'seo_title'
        }, {
            key: 'seo_keyword',
            data_seo: 'seo_keyword'
        }, {
            key: 'seo_description',
            data_seo: 'seo_description'
        }];
    },

    getDefaultButton: function() {
        return $('#btnCheckSeo');
    },

    validateElement: function() {
        let is_valid = true;
        let _this = this;
        this.elements.forEach(function(element) {
            let $current_checking_element = $('[data-seo="' + element.data_seo + '"]');
            let element_value = $current_checking_element.val();
            if ($current_checking_element.hasClass('ckeditor')) {
                let element_name = $current_checking_element.attr('id');
                element_value = CKEDITOR.instances[element_name].getData();
            }

            if (!element_value) {
                _this.showError(element, 'Vui lòng điền vào trường này!');
                is_valid = false;
            }
        });
        return is_valid;
    },

    showError: function(element, message) {
        let $element = $('[data-seo="' + element.data_seo + '"]');
        if (element.key == "seo_keyword" || element.key == "content") {
            $element = $element.next();
        }

        $element.closest('.form-group')
            .find('.help-block')
            .removeClass('text-danger text-success')
            .addClass('text-danger')
            .html(message);
    },

    showSuccess: function (element, message) {
        let $element = $('[data-seo="' + element.data_seo + '"]');
        if (element.key == "seo_keyword" || element.key == "content") {
            $element = $element.next();
        }

        $element.closest('.form-group')
            .find('.help-block')
            .removeClass('text-danger text-success')
            .addClass('text-success')
            .html(message);
    },

    showFinalResult: function () {
        let _this = this;
        this.elements.forEach(function(element) {
            let $element = $('[data-seo="' + element.data_seo + '"]');
            let result = _this.getFinalResult(element.key);
            
            if (result.pass) {
                _this.showSuccess(element, result.score.toFixed(2) + " điểm. " + result.message);
            } else {
                _this.showError(element, result.score.toFixed(2) + " điểm. " + result.message);
            }
        });

        let total_score = this.getFinalResult('total_score');
        let final_score = ((total_score / 60) * 10).toFixed(2);
        infoNotice("Kết quả: ", "Bạn đạt " + final_score + " / 10 điểm cho bài viết này!", {
            timeOut: 5000,
            positionClass: "toast-top-center",
        });
    },

    resetResult : function () {
        this.final_result = {
            total_score: 0,
        };
        this.elements.forEach(function(element) {
            let $element = $('[data-seo="' + element.data_seo + '"]');
            
            if (element.key == "seo_keyword" || element.key == "content") {
                $element = $element.next();
            }
            
            $element.closest('.form-group')
                .find('.help-block')
                .removeClass('text-danger text-success')
                .html("");
        });
    },

    resetChecked: function () {
        this.checked = {
            seo_keyword : false,
            seo_title: false,
            seo_description: false,
            title: false,
            description: false,
            content: false,
        };
    },

    clickCheckSeoBtn: function() {
        console.log(this);
        this.resetResult();
        this.resetChecked();
        if (this.validateElement()) {
            this.getElementData();
            let _this = this;
            this.elements.forEach(function(element) {
                _this.checkElement(element.key);
            });
            setTimeout(function () {
                _this.showFinalResult();
            }, 100);
        }
    },
    
    blurTitleInput: function () {
        let title = this.$titleInput.val();

        slug = title.toLowerCase()
                .trim()
                .replace(/&/g, '-and-')
                .replace(/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/g, 'a')
                .replace(/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/g, 'e')
                .replace(/(ì|í|ị|ỉ|ĩ)/g, 'i')
                .replace(/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/g, 'o')
                .replace(/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/g, 'u')
                .replace(/(ỳ|ý|ỵ|ỷ|ỹ)/g, 'y')
                .replace(/(đ)/g, 'd')
                .replace(/[^a-z0-9-]+/g, '-')
                .replace(/\-\-+/g, '-')
                .replace(/^-+|-+$/g, '');

        this.$seoSlugInput.val(slug);
    },

    changeSeoTitle: function () {
        let seo_title = this.$seoTitleInput.val();
        $('#count_meta_title').html(seo_title.length);
    },

    changeSeoDescription: function () {
        let seo_description = this.$seoDescriptionInput.val();
        $('#count_meta_description').html(seo_description.length);
    },

    checkElement: function(key) {
        let _this = this;
        this.checkSeoKeyword()
            .then(function () {
                if (_this.page == 'detail') {
                    if (key == "title") {
                        return _this.checkDocumentTitle();
                    } else if (key == "description") {
                        return _this.checkDocumentDescription();
                    } else if (key == "content") {
                        return _this.checkDocumentContent();
                    } else if (key == "seo_title") {
                        return _this.checkSeoTitle();
                    } else if (key == "seo_description") {
                        return _this.checkSeoDescription();
                    } else {
                        return;
                    }
                }
                if (_this.page == 'menu') {
                     if (key == "title") {
                        return _this.checkDocumentTitle();
                    } else if (key == "description") {
                        return _this.checkDocumentDescription();
                    } else if (key == "content") {
                        return _this.checkDocumentContent();
                    } else if (key == "seo_title") {
                        return _this.checkSeoTitle();
                    } else if (key == "seo_description") {
                        return _this.checkSeoDescription();
                    } else {
                        return;
                    }
                }
            })
            .catch(function (err) {
                console.log(err);
            });
    },

    checkDocumentTitle: function () {
        let keyword = this.getFinalResult("seo_keyword").keywords[0];

        let title = this.getNormalizedData('title');
        let keyword_appearance_ratio = this.calculateAppearanceRatio(keyword, title);
        
        let check_result = {
            value: title,
            pass: false,
            score: 0,
            message: 'Bạn chưa có trường này!',
        };

        if (keyword_appearance_ratio >= 70) {
            check_result.score = 10;
            check_result.message = "Bạn làm rất chuẩn";
            check_result.pass = true;
        } else {
            check_result.score = keyword_appearance_ratio / 10;
            check_result.message = "Tiêu đề bài viết hoặc sản phẩm cần chứa trên 70% từ khóa";
        }

        this.setFinalResult("title", check_result);
    },

    checkDocumentDescription: function () {
        let description = this.getNormalizedData('description');
        let arr_sentences = this.splitContentToSentence(description);
        let keyword = this.getFinalResult("seo_keyword").keywords[0];
        let total_appearance_ratio = 0;
        let keyword_appearance_ratio = 0;

        let check_result = {
            value: description,
            pass: false,
            score: 0,
            message: 'Bạn chưa có trường này!',
        };

        arr_sentences = this.removeSortSentence(arr_sentences);

        for (var i = 0; i < arr_sentences.length; i++) {
            keyword_appearance_ratio = this.calculateAppearanceRatio(keyword, arr_sentences[i]);
            if (keyword_appearance_ratio >= 50) {
                total_appearance_ratio += keyword_appearance_ratio / 100; 
            }
        }

        if (total_appearance_ratio > 2) {
            check_result.message = "Mô tả trang nên chứa từ 1 - 2 từ khóa là tốt nhất, mô tả của bạn chứa quá nhiều từ khóa!";
        } else if (total_appearance_ratio >= 1.5) {
            check_result.pass = true;
            check_result.message = "Bạn làm rất chuẩn";
            check_result.score = 10;
        } else if (total_appearance_ratio >= 1) {
            check_result.pass = true;
            check_result.message = "Bạn làm rất chuẩn";
            check_result.score = 7;
        } else if (total_appearance_ratio >= 7/5) {
            check_result.pass = true;
            check_result.message = "Bạn cần thêm từ khóa";
            check_result.score = 7 * total_appearance_ratio;
        } else {
            check_result.message = "Mô tả của bạn không chứa từ khóa nào, vui lòng thêm 1 hoặc 2 từ khóa";
        }

        this.setFinalResult('description', check_result);
    },

    checkDocumentContent: function () {
        let content = this.getNormalizedData('content');
        let arr_sentences = this.splitContentToSentence(content);
        let keyword = this.getFinalResult("seo_keyword").keywords[0];
        let keyword_appearance_ratio = 0;
        let check_result = {
            value: content,
            pass: false,
            score: 0,
            message: "Bạn chưa có trường này!",
        };
        arr_sentences = this.removeSortSentence(arr_sentences);

        for (let i = 0; i < arr_sentences.length; i++) {
            let sentence = this.removeAccent(arr_sentences[i]);
            let temp_keyword_APR = this.calculateAppearanceRatio(keyword, sentence);

            if (temp_keyword_APR >= 80) {
                keyword_appearance_ratio += temp_keyword_APR / 100;
            }
        }

        let num_word_content = this.countWords(content);
        let num_word_keyword = this.countWords(keyword);
        let percent_keyword_in_content = ((keyword_appearance_ratio * num_word_keyword) / num_word_content) * 100;
        
        if (percent_keyword_in_content <= 0) {
            check_result.message = "Bạn nên rải từ khóa, Google sẽ không biết bạn SEO từ nào";
        } else if (percent_keyword_in_content < 1) {
            check_result.message = "Từ khóa xuất hiện quá ít, bạn nên thêm từ khóa vào nội dung bài viết!";
        } else if (percent_keyword_in_content <= 3) {
            check_result.message = "Từ khóa xuất hiện hơi ít, bạn nên rải thêm nhé!";
            check_result.score = (percent_keyword_in_content - 1) * 2.5;
        } else if (percent_keyword_in_content <= 5) {
            check_result.message = "Bạn chèn từ khóa chuẩn";
            check_result.score = (percent_keyword_in_content - 1) * 2.5;
        } else if (percent_keyword_in_content <= 7) {
            check_result.message = "Bạn chèn từ khóa chuẩn";
            check_result.score = (9 - percent_keyword_in_content) * 2.5;
        } else if (percent_keyword_in_content <= 9) {
            check_result.message = "Bạn chèn từ khóa hơi nhiều, nên giảm bớt lại nhé!";
            check_result.score = (9 - percent_keyword_in_content) * 2.5;
        } else {
            check_result.message = "Bạn chèn từ khóa quá nhiều, nên giảm bớt lại";
            check_result.score = 0;
        }

        this.setFinalResult('content', check_result);
    },

    checkSeoTitle: function () {
        let seo_title = this.getNormalizedData('seo_title');
        let keyword = this.getFinalResult("seo_keyword").keywords[0];
        let keyword_appearance_ratio = this.calculateAppearanceRatio(keyword, seo_title);

        let check_result = {
            value: seo_title,
            pass: false,
            score: 0,
            message: "Bạn chưa có trường này!",
        };

        if (keyword_appearance_ratio >= 80) {
            check_result.score = 10;
            check_result.pass = true;
            check_result.message = "Bạn làm rất chuẩn";
        } else {
            check_result.pass = false;
            check_result.score = keyword_appearance_ratio / 100;
            check_result.message = "Tiêu đề seo có " + keyword_appearance_ratio / 100 + " từ khóa giống, bạn nên thêm vài từ nữa!";
        }

        this.setFinalResult('seo_title', check_result);
    },

    checkSeoDescription: function () {
        let seo_description = this.getNormalizedData('seo_description');
        let keyword = this.getFinalResult("seo_keyword").keywords[0];
        let arr_sentences = this.splitContentToSentence(seo_description);
        let total_appearance_ratio = 0;
        let keyword_length = this.countWords(keyword);
       
        let check_result = {
            value : seo_description,
            pass: false,
            score: 0,
            message: 'Bạn chưa có trường này!',
        };

        arr_sentences = this.removeSortSentence(arr_sentences);

        for (var i = 0; i < arr_sentences.length; i++) {
            let keyword_appearance_ratio = this.calculateAppearanceRatio(keyword, arr_sentences[i]);

            if (keyword_appearance_ratio == 100) {
                total_appearance_ratio += 1; 
            } else if (keyword_appearance_ratio >= 50) {
                total_appearance_ratio += 0.5;
            } else {
                total_appearance_ratio += 0;
            }
        }

        if (total_appearance_ratio == 0) {
            check_result.message = "Mô tả SEO của bạn không chưa từ khóa nào, nên thêm 1 hoặc 2 từ khóa!";
            this.setFinalResult('seo_description', check_result);
            return;
        }

        if (total_appearance_ratio > 2) {
            check_result.message = "Mô tả SEO của bạn chứa quá nhiều từ khóa, nên giảm lại còn 1 - 2 từ khóa là tốt nhất!";
            this.setFinalResult('seo_description', check_result);
            return;
        }

        if (keyword_length <= 4 && total_appearance_ratio < 1) {
            check_result.pass = true;
            check_result.score = total_appearance_ratio * 7;
            check_result.message = "Từ khóa nên lặp lại 2 lần trong mô tả SEO bạn nhé!";
            this.setFinalResult('seo_description', check_result);
            return;
        }

        if (keyword_length <= 4 && total_appearance_ratio == 2) {
            check_result.pass = true;
            check_result.score = 10;
            check_result.message = "Bạn làm rất chuẩn";
            this.setFinalResult('seo_description', check_result);
            return;
        }

        if (keyword_length <= 4 && total_appearance_ratio >= 1) {
            check_result.pass = true;
            check_result.score = 7;
            check_result.message = "Từ khóa nên lặp lại 2 lần trong mô tả SEO bạn nhé!";
            this.setFinalResult('seo_description', check_result);
            return;
        }

        if (keyword_length > 4 && total_appearance_ratio >= 1.5) {
            check_result.pass = true;
            check_result.score = 10;
            check_result.message = "Bạn làm rất chuẩn";
            this.setFinalResult('seo_description', check_result);
            return;
        }

        if (keyword_length > 4 && total_appearance_ratio >= 1) {
            check_result.pass = true;
            check_result.score = 7;
            check_result.message = "Trong phần mô tả Seo từ khóa nên lặp lại 1.5 - 2 lần bạn nhé!";
            this.setFinalResult('seo_description', check_result);
            return;
        }
        if (keyword_length > 4 && total_appearance_ratio < 1) {
            check_result.pass = true;
            check_result.score = total_appearance_ratio * 7;
            check_result.message = "Trong phần mô tả Seo từ khóa nên lặp lại 1.5 - 2 lần bạn nhé!";
            this.setFinalResult('seo_description', check_result);
            return;
        }

        this.setFinalResult('seo_description', check_result);
        return;
    },

    checkSeoKeyword: function () {
        return new Promise ((resolve, reject) => {
            
            if (this.checked.seo_keyword) {
                return resolve();
            }

            this.checked.seo_keyword = true;

            let keywords = this.getNormalizedData('seo_keyword');
            let arr_keywords = this.splitContentToKeyword(keywords);
            let check_result = {
                keywords: arr_keywords,
                pass: false,
                score: 0,
                message: '',
            };
            
            if (arr_keywords.length !== 2) {
                check_result.message = 'Bạn vui lòng nhập 2 từ khóa có dấu và không dấu!';
                this.setFinalResult("seo_keyword", check_result);
                return resolve(1);
            }

            let first_keyword = this.removeAccent(arr_keywords[0]);
            let second_keyword = this.removeAccent(arr_keywords[1]);

            if (first_keyword != second_keyword) {
                check_result.message = 'Từ khóa có dấu và không dấu phải giống nhau!';
                this.setFinalResult("seo_keyword", check_result);
                return resolve(2);
            }

            let keyword_length = this.countWords(first_keyword);
            if (keyword_length < 4 || keyword_length > 10) {
                check_result.message = 'Độ dài từ khóa không phù hợp, bạn nên chọn từ khóa có độ dài từ 4 đến 10 từ là đủ!';
                this.setFinalResult("seo_keyword", check_result);
                return resolve(3);
            }

            // because we don't know which keyword is signed, which one is unsigned
            // so i compare removed-accent keyword to first and second original keyword
            // the first one matched is unsigned, and the second is signed
            // the final keyword array is
            // [0] => signed keyword
            // [1] => unsigned keyword
            if (first_keyword == arr_keywords[0]) {
                check_result.keywords = [arr_keywords[1], arr_keywords[0]];
            } else {
                check_result.keywords = [arr_keywords[0], arr_keywords[1]];
            }

            check_result.pass = true;
            check_result.score = 10;
            check_result.message = "Bạn làm rắt chuẩn";
            this.setFinalResult("seo_keyword", check_result);
            return resolve();
        });
    },

    normalizeContent: function (content) {
        let tmp = document.createElement("DIV");
        tmp.innerHTML = content;
        let result = tmp.textContent||tmp.innerText;
        return result.toLowerCase()
                     .trim();
    },

    splitContentToSentence: function (content) {
        let sentences = content.split(this.REGEX_SPLIT_SENTENCE);
        for (var i = sentences.length - 1; i >= 0; i--) {
            sentences[i] = sentences[i].trim();
        }
        return sentences;
    },

    splitContentToKeyword: function (content) {
        let sentences = content.split(this.REGEX_SPLIT_KEYWORD);
        for (var i = sentences.length - 1; i >= 0; i--) {
            sentences[i] = sentences[i].trim();
        }
        return sentences;
    },

    removeSortSentence: function (arr_sentences) {
        for (var i = arr_sentences.length - 1; i >= 0; i--) {
            // console.log(arr_sentences[i] + " => " + this.countWords(arr_sentences[i]));
            if (this.countWords(arr_sentences[i]) < 3) {
                arr_sentences.splice(i, 1);
            }
        }
        return arr_sentences;
    },

    countWords: function(sentence) {
        return sentence
            .trim()
            .split(' ').length;
    },

    removeAccent: function (string) {
        return string.replace(/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|&aacute;|&agrave;|&acirc;|&atilde;)/g, 'a')
            .replace(/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|&eacute;|&ecirc;)/g, 'e')
            .replace(/(ì|í|ị|ỉ|ĩ|&iacute;|&igrave;)/g, 'i')
            .replace(/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|&oacute;|&ocirc;|&ograve;)/g, 'o')
            .replace(/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|&uacute;|&ugrave;)/g, 'u')
            .replace(/(ỳ|ý|ỵ|ỷ|ỹ|&yacute;)/g, 'y')
            .replace(/(đ)/g, 'd')
            .replace(/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ|&Aacute;|&Agrave;|&Acirc;|&Atilde;)/g, 'A')
            .replace(/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ|&Eacute;|&Ecirc;)/g, 'E')
            .replace(/(Ì|Í|Ị|Ỉ|Ĩ|&Iacute;|&Igrave;)/g, 'I')
            .replace(/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ|&Oacute;|&Ocirc;|&Ograve;)/g, 'O')
            .replace(/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ|&Uacute;|&Ugrave;)/g, 'U')
            .replace(/(Ỳ|Ý|Ỵ|Ỷ|Ỹ|&Yacute;)/g, 'Y')
            .replace(/(Đ)/g, 'D')
            .replace(/(&nbsp;)/g, '');
    },

    removeSymbol: function (string) {
        return string.replace(this.REGEX_REMOVE_SYMBOL, "");
    },

    splitContentToWord : function (content) {
        let arr_words = content.split(this.REGEX_SPLIT_WORD);
        for (let i = arr_words.length - 1; i >= 0; i--) {
            arr_words[i] = arr_words[i].trim();
        }
        return arr_words;
    },

    calculateAppearanceRatio: function (string, content) {
        let content_words = this.splitContentToWord(content);
        let string_words = this.splitContentToWord(string);
        let num_of_appearance = 0;
        let content_length = content_words.length;
        let string_length = string_words.length;

        if (content_length < string_length) {
            return 0;
        }

        for (var i = 0; i < content_length; i++) {
            for (var j = 0; j < string_words.length; j++) {
                let content_word = this.removeSymbol(content_words[i]);
                let string_word = this.removeSymbol(string_words[j]);
                
                if (content_word == string_word) {
                    num_of_appearance ++ ;
                    string_words.splice(j, 1);
                    break;
                }
            }
        }

        return (num_of_appearance/string_length)*100;
    },

    /*
     * Tag input
     */

    createTagInputForSeoKeyword: function () {
        let $seoKeywordInput = this.$seoContainer.find('input[data-seo="seo_keyword"]');
        
        $seoKeywordInput.selectize({
            delimiter: ",",
            presist: false,
            create: function (input) {
                return {
                    value: input,
                    text: input
                };
            }
        });
    }
};

var WBSeo = new WBSeoClass();