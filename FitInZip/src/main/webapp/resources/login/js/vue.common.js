//import PlayList from '/component/play_list';




var methods = {
    numberFormat(num, decimals, dec_point, thousands_sep) {
        num = parseFloat(num);
        if(isNaN(num)) return '0';

        if(typeof(decimals) == 'undefined') decimals = 0;
        if(typeof(dec_point) == 'undefined') dec_point = '.';
        if(typeof(thousands_sep) == 'undefined') thousands_sep = ',';
        decimals = Math.pow(10, decimals);

        num = num * decimals;
        num = Math.round(num);
        num = num / decimals;

        num = String(num);
        var reg = /(^[+-]?\d+)(\d{3})/;
        var tmp = num.split('.');
        var n = tmp[0];
        var d = tmp[1] ? dec_point + tmp[1] : '';

        while(reg.test(n)) n = n.replace(reg, "$1"+thousands_sep+"$2");

        return n + d;
    },
    addDays(date, days) {
        var result = new Date(methods.replaceDate(date));
        result.setDate(result.getDate() + (days-1));

        return result.format('Y-m-d');
    },
    phoneNumberParse(num) {
        if(num.length >= 11) {
            return num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");
        } else {
            return num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");
        }
    },
    setTerms(sdt,edt,fmt) {
        fmt = !fmt ? 'Y.m.d' : fmt;
        var str = "";
        var startDate = new Date(methods.replaceDate(sdt));
        var endDate = new Date(methods.replaceDate(edt));

        str += startDate.format(fmt) + " - ";

        if(startDate.getFullYear() == endDate.getFullYear()) {
            str += new Date(methods.replaceDate(edt)).format('m.d');
        } else {
            str += endDate.format(fmt);
        }

        return str;
    },
    convert12Hour(tm,tmType,fmtType,labels) {
        label = labels || ['오전 ','오후 '];
        tmType = tmType || 1; // 1 : 24시간, 2 : 12시간
        fmtType = fmtType || 1; // 1 : string, 2 : int
        var arr = tm.split(':');
        var t = ( arr[0] == '12' ? 12 : parseInt(arr[0])%12 );

        return label[parseInt(parseInt(arr[0])/12)] + String(t).padStart(2, '0') + ':' + arr[1].padStart(2, '0');
    },
    convert6Hour(tm,tmType,fmtType,labels) {
        var label = labels || ['심야 ','오전 ','오후 ','저녁 ']
        tmType = tmType || 1; // 1 : 24시간, 2 : 12시간
        fmtType = fmtType || 1; // 1 : string, 2 : int
        var arr = tm.split(':');
        var t = ( arr[0] == '12' ? 12 : parseInt(arr[0])%12 );

        return label[parseInt(parseInt(arr[0])/6)] + String(t).padStart(2, '0') + ':' + arr[1].padStart(2, '0');
    },
    convertHour(tm,div,tmType,fmtType,labels) {
        div = div || 12;
        tmType = tmType || 1; // 1 : 24시간, 2 : 12시간
        fmtType = fmtType || 1; // 1 : string, 2 : int
        var label;
        switch(div){
            case 6 : label = ['심야 ','오전 ','오후 ','저녁 ']; break;
            case 12 : label = ['오전 ','오후 ']; break;
            default : label = ['','','',''];
        }
        label = labels ? labels : label;
        var arr = tm.split(':');
        var t = tmType == 2 ? ( arr[0] == '12' ? 12 : parseInt(arr[0])%12 ) : parseInt(arr[0])
        var tmString = label[parseInt(parseInt(arr[0])/div)];
        if ( fmtType == 1 ) {
            tmString += String(t).padStart(2, '0') + ':' + arr[1].padStart(2, '0');
        } else {
            tmString += t + ':' + arr[1];
        }
        return tmString
    },
    getDateDiff(sdt, edt) {
        return Math.floor((new Date(methods.replaceDate(edt)).getTime() - new Date(methods.replaceDate(sdt)).getTime())/(1000*60*60*24));
    },
    getPassDay(date) {
        return Math.ceil((new Date().getTime() - new Date(methods.replaceDate(date)).getTime())/(1000*60*60*24));
    },
    getDday(date) {
        return Math.floor((new Date(methods.replaceDate(date)).getTime() - new Date().getTime())/(1000*60*60*24));
    },
    getDayPercent(sdt, edt) {
        var diff = methods.getDateDiff(sdt,edt);    // 총 모집기간
        var today = methods.getDday(edt);           // 남은 기간
        return Math.ceil((diff-today)/diff*100);
    },
    getMonth(date) {
        return new Date(methods.replaceDate(date)).getMonth()+1;
    },
    getDiscount(prodAmt, saleAmt) {
        return Math.floor((prodAmt - saleAmt)/prodAmt*100);
    },
    replaceDate(date) {
        return date ? (methods.ISOFormatValidator(date) ? date : date.replace(/[.-]/gi, "/")) : '';
    },
    ISOFormatValidator(date) {
        var reg = /^(-?(?:[1-9][0-9]*)?[0-9]{4})-(1[0-2]|0[1-9])-(3[01]|0[1-9]|[12][0-9])T(2[0-3]|[01][0-9]):([0-5][0-9]):([0-5][0-9])(.[0-9]+)?(Z)?$/;
        return reg.test(date);
    },
    findStartWeek(week) {
        return week.indexOf(',') > -1 ? week.split(',')[0] : week;
    },
    getWeekDiff(startDate, endDate) {
        return Math.ceil(parseInt((new Date(endDate) - new Date(startDate)) / (24 * 60 * 60 * 1000) + 1) / 7);
    },
    weekNumberByMonth(dateFormat) {
        const inputDate = new Date(methods.replaceDate(dateFormat));

        // 인풋의 년, 월
        let year = inputDate.getFullYear();
        let month = inputDate.getMonth() + 1;

        // 목요일 기준 주차 구하기
        const weekNumberByThurFnc = (paramDate) => {

          const year = paramDate.getFullYear();
          const month = paramDate.getMonth();
          const date = paramDate.getDate();

          // 인풋한 달의 첫 날과 마지막 날의 요일
          const firstDate = new Date(year, month, 1);
          const lastDate = new Date(year, month+1, 0);
          const firstDayOfWeek = firstDate.getDay() === 0 ? 7 : firstDate.getDay();
          const lastDayOfweek = lastDate.getDay();

          // 인풋한 달의 마지막 일
          const lastDay = lastDate.getDate();

          // 첫 날의 요일이 금, 토, 일요일 이라면 true
          const firstWeekCheck = firstDayOfWeek === 5 || firstDayOfWeek === 6 || firstDayOfWeek === 7;
          // 마지막 날의 요일이 월, 화, 수라면 true
          const lastWeekCheck = lastDayOfweek === 1 || lastDayOfweek === 2 || lastDayOfweek === 3;

          // 해당 달이 총 몇주까지 있는지
          const lastWeekNo = Math.ceil((firstDayOfWeek - 1 + lastDay) / 7);

          // 날짜 기준으로 몇주차 인지
          let weekNo = Math.ceil((firstDayOfWeek - 1 + date) / 7);

          // 인풋한 날짜가 첫 주에 있고 첫 날이 월, 화, 수로 시작한다면 'prev'(전달 마지막 주)
          if(weekNo === 1 && firstWeekCheck) weekNo = 'prev';
          // 인풋한 날짜가 마지막 주에 있고 마지막 날이 월, 화, 수로 끝난다면 'next'(다음달 첫 주)
          else if(weekNo === lastWeekNo && lastWeekCheck) weekNo = 'next';
          // 인풋한 날짜의 첫 주는 아니지만 첫날이 월, 화 수로 시작하면 -1;
          else if(firstWeekCheck) weekNo = weekNo -1;

          return weekNo;
        };

        // 목요일 기준의 주차
        let weekNo = weekNumberByThurFnc(inputDate);

        // 이전달의 마지막 주차일 떄
        if(weekNo === 'prev') {
          // 이전 달의 마지막날
          const afterDate = new Date(year, month-1, 0);
          year = month === 1 ? year - 1 : year;
          month = month === 1 ? 12 : month - 1;
          weekNo = weekNumberByThurFnc(afterDate);
        }
        // 다음달의 첫 주차일 때
        if(weekNo === 'next') {
          year = month === 12 ? year + 1 : year;
          month = month === 12 ? 1 : month + 1;
          weekNo = 1;
        }

        return {year, month, weekNo};
    },
    weekNumberByStartEnd(data) {
        var formatDate = function(date) {
            var myMonth = date.getMonth() + 1;
            var myWeekDay = date.getDate();
            var addZero = function(num) {
                if (num < 10) { num = "0" + num; }
                return num;
            }
            // return `${addZero(myMonth)}월 ${addZero(myWeekDay)}일`;
            return `${myMonth}월 ${myWeekDay}일`;
        }

        var nowDayOfWeek = data.getDay() - 1;
        var nowDay = data.getDate();
        var nowMonth = data.getMonth();
        var nowYear = data.getYear();
        nowYear += (nowYear < 2000) ? 1900 : 0;
        var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
        var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
        // var startDate = `${nowYear}-${formatDate(weekStartDate)}`;
        // var endDate = `${nowYear}-${formatDate(weekEndDate)}`;
        var startDate = `${formatDate(weekStartDate)}`;
        var endDate = `${formatDate(weekEndDate)}`;

        return {startDate, endDate};
    },

}

Vue.component('loading-img', {
    template: "<div class=\"loading\"><span><img src=\"//img.hamggae.com/mobile/common/icon/loading.gif\"></span></div>"
});

/*
Vue.component('play-list', {
    template: <PlayList />,
    data: {
        isLoaded: false,
        isFilter : true,
        isWebView: false,
        userKey: "",
        seasonTypes: ['ready', 'start','end'],
        alarms: {},
        coachingProgramSeasons: {},
        coachingPrograms: {},
        programs: {},
        packages: {},
        seasons: {
            ready: {
                title: '진행예정 클래스',
                subTitle: '진행 예정인 클래스입니다. 결원 시 추가 모집이 진행되오니 관심♡ 버튼을 눌러주세요.',
                noDataText: '현재 진행예정 클래스가 없습니다.',
                data: []
            },
            start: {
                title: '진행중 클래스',
                subTitle: '',
                noDataText: '현재 진행중인 클래스가 없습니다.',
                data: []
            },
            end: {
                title: '종료된 클래스',
                subTitle: '',
                noDataText: '현재 종료된 클래스가 없습니다.',
                data: []
            },
        },
        seasonWeeks: {},
        filter: {},
        searchResults: {
            startMonth: [],
            weekDay: [],
            goal: [],
            cate: [],
            gender: [],
            time: []
        },
        searchDisplay : 0,
        search: {
            startMonth: [
                { name: '1월', value: '1월' },
                { name: '2월', value: '2월' },
                { name: '3월', value: '3월' },
                { name: '4월', value: '4월' },
                { name: '5월', value: '5월' },
                { name: '6월', value: '6월' },
                { name: '7월', value: '7월' },
                { name: '8월', value: '8월' },
                { name: '9월', value: '9월' },
                { name: '10월', value: '10월' },
                { name: '11월', value: '11월' },
                { name: '12월', value: '12월' },
            ],
            weekDay: [
                { name: '월', value: '월' },
                { name: '화', value: '화' },
                { name: '수', value: '수' },
                { name: '목', value: '목' },
                { name: '금', value: '금' },
                { name: '토', value: '토' },
                { name: '일', value: '일' },
            ],
            goal: [
                { name: '전신', value: '전신' },
                { name: '코어', value: '코어' },
                { name: '상체', value: '상체' },
                { name: '하체', value: '하체' },
                { name: '재활', value: '재활' },
                { name: '근력', value: '근력' },
                { name: '심신안정', value: '심신안정' },
                { name: '스트레칭', value: '스트레칭' },
            ],
            cate: [
        //        { name: '웨이트', value: '웨이트' },
                { name: '필라테스', value: '필라테스' },
                { name: '요가', value: '요가' },
                { name: '피트니스', value: '피트니스' },
                { name: '타바타', value: '타바타' },
                { name: '발레', value: '발레' },
                { name: '댄스', value: '댄스' },
                { name: '스피닝', value: '스피닝' },
                { name: '체형교정', value: '체형교정' },
                { name: '다이어트', value: '다이어트' },
            ],
            gender: [
                { name: '여성전용', value: '여성전용' },
                { name: '남성전용', value: '남성전용' },
                { name: '남녀누구나', value: '남녀누구나' },
            ],
            time: [
                { name: '오전 (6시~11시)', value: '1' },
                { name: '오후 (12시~17시)', value: '2' },
                { name: '저녁 (18시~23시)', value: '3' },
            ]
        },
        searchForm: [
            { title: '요일', class: 'mw-121', data : 'weekDay'},
            { title: '시간', class: 'mw-176', data : 'time'},
            { title: '성별', class: 'mw-176', data : 'gender'},
            { title: '운동목적', class: 'mw-195', data : 'goal'},
            // { title: '운동종류', class: 'mw-195', data : 'cate'},
            // { title: '개강월', class: 'mw-200', data : 'startMonth'},
        ],
        swiperOptions: {
            slidesPerView: 5,
            speed : 600,
            spaceBetween: 20,
        },
        swiperOptions2: {
            navigation: {
                nextEl: '#play_rolling1_next',
                prevEl: '#play_rolling1_prev',
            },
            pagination: {
                el: '.swiper-pagination',
                type: 'fraction',
                formatFractionCurrent: function (number) {
                    var param = '0'
                    number = param + number;
                    return number;
                },
                formatFractionTotal: function (number) {
                    var param = '0'
                    number = param + number;
                    return number;
                },
            },
            autoplay: {
                delay: 4000,
                disableOnInteraction: true,
            },
            effect: 'fade',
            slidesPerView: 1,
            //loop: true,
            fadeEffect: {
                crossFade: true,
            },
            speed: 1000,
            allowTouchMove: false,
            on: {
                init: function() {
                    $("#progress")
                    .clearQueue()
                    .stop()
                    .css(
                        {width:'0%'}
                    )
                    .animate({
                        width: "100%"
                    }, 4000);
                },
                slideChange: function () {
                    $("#progress")
                    .clearQueue()
                    .stop()
                    .css(
                        {width:'0%'}
                    )
                    .animate({
                        width: "100%"
                    }, 4000);
                }
            }
        },
        swiperOptions3: {
            navigation: {
                nextEl: '#filter_slide_next',
                prevEl: '#filter_slide_prev',
            },
            watchOverflow: true,
            slidesPerView: 'auto',
            spaceBetween: 10,
            on: {
                reachBeginning: function () {
                    $('#filter_slide_prev').hide();
                },
                reachEnd: function () {
                    $('#filter_slide_next').hide();
                },
                fromEdge: function () {
                    $('#filter_slide_prev').show();
                    $('#filter_slide_next').show();
                },
            }
        },
    },
    methods: {
        async initData() {

            try {
                var self = this;

                if (self.userKey) {
                    var alarms = await axios({
                        method: 'POST',
                        url: '<?=$_config["APIURL"]?>/w1/user/programAlarms',
                        data: { userKey :  self.userKey},
                        responseType: 'json'
                    });

                    if (alarms.data.resultCode == 1) {
                        for (var i in alarms.data.alarms) {
                            self.alarms[alarms.data.alarms[i].seasonKey] = alarms.data.alarms[i];
                        }
                    }
                }

                var seasons = await axios({
                    method: 'POST',
                    url: '<?=$_config["APIURL"]?>/w1/program/coachingProgramSeasons',
                    data: {},
                    responseType: 'json'
                });
                self.coachingProgramSeasons = seasons.data.seasons;

               
                var coachingPrograms = await axios({
                    method: 'POST',
                    url: '<?=$_config["APIURL"]?>/w1/program/coachingPrograms',
                    responseType: 'json'
                });

                self.coachingPrograms = {};
                for(var i in coachingPrograms.data.coachingPrograms) {
                    self.coachingPrograms[coachingPrograms.data.coachingPrograms[i].coachingProgramKey] = coachingPrograms.data.coachingPrograms[i];
                }


                var packages = await axios({
                    method: 'POST',
                    url: '<?=$_config["APIURL"]?>/w1/product/packages',
                    responseType: 'json'
                });

                self.packages = {};
                for(var i in packages.data.packages) {
                    self.packages[packages.data.packages[i].packageKey] = packages.data.packages[i];
                }

                this.fetchData();

            } catch (error) {
                console.log(error);
            }
        },
        fetchData() {
            // 검색 버튼 닫음
            //$('.filter_container').hide();

            this.filter = this.searchResults;

            try {
                var self = this;

                self.seasons.ready.data = [];
                self.seasons.start.data = [];

                for(var i in self.coachingProgramSeasons) {

                    var season = self.coachingProgramSeasons[i]

                    season.play_type = 'lives'
                    if ( season.startDate == season.endDate ) season.play_type = 'onedays'

                    if ( season.play_type != play_type ) continue;

                    var filterChk = true
                    for (var a in this.filter) {

                        var filterSubCheck = false
                        if ( this.filter[a].length == 0 ) {
                            filterSubCheck = true
                        } else {
                            for (var b in this.filter[a]) {
                                var val = -1;
                                if ( a == 'time' ) {
                                    let arrTm = season.lecture_time.split(':')
                                    switch(this.filter[a][b]) {
                                        case '1' : if ( arrTm[0] >= '06' && arrTm[0] <= '11' ) val = 1; break;
                                        case '2' : if ( arrTm[0] >= '12' && arrTm[0] <= '17' ) val = 2; break;
                                        case '3' : if ( arrTm[0] >= '18' && arrTm[0] <= '23' ) val = 3; break;
                                    }
                                } else {
                                    val = season.seasonFilters.findIndex((element) => element == this.filter[a][b])
                                }
                                if ( val >= 0 ) {
                                    filterSubCheck = true
                                    break
                                }
                            }
                        }

                        if ( !filterSubCheck ) {
                            filterChk = false
                            break
                        }
                    }

                    if ( self.searchDisplay == 1 && ( season.applyEndDate < '<?=date('Y-m-d')?>' || season.applyInwon <= season.joinInwon ) ) {
                        filterChk = false
                    }

                    if ( !filterChk ) continue;

                    season.isAlways = false
                    if ( season.applyEndDate == '9999-12-31' ) {
                        season.isAlways = true
                    }
                    season.alarm = 0;
                    season.alarmKey = 0;

                    if (self.alarms[season.seasonKey]) {
                        season.alarm = self.alarms[season.seasonKey].alarmFlag;
                        season.alarmKey = self.alarms[season.seasonKey].alarmKey;
                    }

                    for (var j in season.seasonInfos) {
                        season[season.seasonInfos[j].key] = season.seasonInfos[j].value;
                    }

                    // 시간 자르기
                    let startTime = '';
                    let endTime = '';
                    if (season.lecture_time) {
                        const arrTime = season.lecture_time.split(' ~ ');
                        startTime = ' ' + arrTime[0];
                        endTime = ' ' + arrTime[1];
                    }

                    const nowDateTime = new Date().getTime();
                    const startDateTime = new Date(self.$common.replaceDate(season.startDate + startTime)).getTime();
                    const endDateTime = new Date(self.$common.replaceDate(season.endDate + endTime)).getTime();
                    season.startDateTime = startDateTime;
                    season.endDateTime = endDateTime;
                    season.week = self.$common.weekNumberByMonth(new Date(self.$common.replaceDate(season.startDate)).format('Y-n-j'));

                    // 진행중 클래스
                    if (startDateTime < nowDateTime &&  endDateTime > nowDateTime) {
                        self.seasons.start.data.push(season);
                    }
                    // 종료된 클래스 
                    else if (endDateTime <= nowDateTime || season.applyFlag == 5) {
                        self.seasons.end.data.push(season);
                    }
                    // 진행예정 클래스
                    else {
                        if (self.$common.getDday(season.applyEndDate) >= -1 &&
                            startDateTime > nowDateTime) {
                            self.seasons.ready.data.push(season);
                        }
                    }

                }

                // 시간순 정렬
                self.seasons.ready.data.sort((a, b) => a.startDateTime < b.startDateTime ? -1 : a.startDateTime > a.startDateTime ? 1 : 0);
                self.seasons.start.data.sort((a, b) => a.startDateTime < b.startDateTime ? -1 : a.startDateTime > a.startDateTime ? 1 : 0);

                // 주차별 정렬
                self.seasonTypes = [];
                self.seasonWeeks = [];

                for (var season of self.seasons.ready.data) {
                  
                    //const tmpKey  = 'ready';
                    const tmpKey = `${season.week.year}${season.week.month}${season.week.weekNo}`; 

                    if (typeof self.seasonWeeks[tmpKey] == 'undefined') {
                        const weekStartEnd = self.$common.weekNumberByStartEnd(new Date(self.$common.replaceDate(season.startDate)));
                        self.seasonWeeks[tmpKey] = {title: '', subTitle: '', data: []};

                        self.seasonWeeks[tmpKey].title = `${season.week.month}월 ${season.week.weekNo}주 시작 클래스`;
                        self.seasonWeeks[tmpKey].subTitle = `${weekStartEnd.startDate} ~ ${weekStartEnd.endDate} 진행 예정인 클래스입니다. 결원 시 추가 모집이 진행되오니 관심♡ 버튼을 눌러주세요.`;

                        //self.seasonWeeks[tmpKey].title = `마감된 클래스`;
                        //self.seasonWeeks[tmpKey].subTitle = `피클라이브 베타서비스 기간 진행되었던 클래스입니다. 곧 정식서비스로 오픈될 알찬 클래스를 기대해주세요!`; 
                        self.seasonWeeks[tmpKey].data = [];
                        self.seasonTypes.push(tmpKey);
                    }

                    self.seasonWeeks[tmpKey].data.push(season);
                }



                // // 진행중 클래스 추가
                if ( self.seasons.start.length > 0 ) {
                    self.seasonTypes.push('start');
                    self.seasonWeeks['start'] = self.seasons.start;
                }

                // 표시 데이터 교체
                self.seasonWeeks;

                self.isLoaded = true;

            } catch (error) {
                console.log(error);
            }
        },
        openReservePop(seasonKey) {
            Bsjs_Modal('play_recruit', '/popup/play_recruit/'+seasonKey, {top: window.pageYOffset+100});
        },
        prev(swiper) {
            swiper.slidePrev();
        },
        next(swiper) {
            swiper.slideNext();
        },
        resetSearch(cate) {
            if ( cate == '' || cate == 'startMonth' ) this.searchResults.startMonth = [];
            if ( cate == '' || cate == 'time' ) this.searchResults.time = [];
            if ( cate == '' || cate == 'weekDay' ) this.searchResults.weekDay = [];
            if ( cate == '' || cate == 'goal' ) this.searchResults.goal = [];
            if ( cate == '' || cate == 'cate' ) this.searchResults.cate = [];
            if ( cate == '' || cate == 'gender' ) this.searchResults.gender = [];
            if ( cate == '' ) this.searchDisplay = 0;
            //$('.filterbtn').removeClass('on');

            $('.filter_container').hide();
            this.fetchData();
        },
        searchDisplayClick() {
            this.searchDisplay = ( this.searchDisplay * -1 ) + 1
            $('.filter_container').hide();
            this.fetchData();
        },
        cateClick(obj) {
            self.isLoaded = false;
            this.searchResults.cate = [];

            if (typeof obj != "undefined") {
                this.searchResults.cate.push(obj);
            }

            $('.filter_container').hide();
            this.fetchData();
        },
        setAlarm(season) {
            if (this.userKey == "") {
                this.showAlert('로그인 후 사용 가능합니다.');
                return;
            }

            season.alarm = season.alarm == 1 ? 0 : 1;

            try {
                if (season.alarm == 0) {
                    axios({
                        method: 'PATCH',
                        url: '<?=$_config["APIURL"]?>/w1/user/programAlarmCancel',
                        data: { userKey: this.userKey, alarmKey: season.alarmKey },
                        responseType: 'json'
                    }).then((res) => {
                        if (res.data.resultCode == 1) {
                            this.showAlert('관심클래스가 취소되었습니다.');
                        }
                    }).catch((error) => {
                        console.log(error);
                    });
                } else {
                    axios({
                        method: 'POST',
                        url: '<?=$_config["APIURL"]?>/w1/user/programAlarm',
                        data: { userKey:  this.userKey, seasonKey: season.seasonKey },
                        responseType: 'json'
                    }).then((res) => {
                        if (res.data.resultCode == 1) {
                            season.alarmKey = res.data.alarmKey;
                            this.showAlert('관심클래스로 지정되었습니다.');
                        }
                    }).catch((error) => {
                        console.log(error);
                    });

                }
            } catch (error) {
                console.log(error);
            }
        },
        showAlert(msg) {
            if (this.isWebView) {
                window.flutter_inappwebview.callHandler('onAlertMessage', msg);
            } else {
                BsJs_toastPopup(msg, 'error', function() {});
            }
        }
    },
    created: function() {
       this.initData();
    }
});
*/
Vue.prototype.$common = methods;