<%@ page contentType="text/html;charset=utf-8"%>


<link rel="stylesheet" href="../../../../js/chatRecord/viewer.css">
<script src="../../../../js/chatRecord/amrnb.js"></script>
<script src="../../../../js/chatRecord/amrplayer.js"></script>
<script src="../../../../js/chatRecord/viewer.js"></script>

<style>
    .bigbox {
        width: 100%;
        height: 100vh;
        /* 很重要，如果设置成 100%，页面内容过多时不会固定 */
        display: flex;
        flex-direction: column;
        box-sizing: border-box;
    }

    .headChat {
        padding: 10px 15px 5px;
        border-bottom: 1px solid #e8e8e8;
        height: 50px;
    }

    .headChatee {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .headChatee div {
        font-size: 22px;
    }

    .avtaor {
        height: 30px;
        line-height: 30px;
        display: flex;
        align-items: center;
        text-align: left;
    }

    .avtaor img {
        width: 30px;
        height: 30px;
        margin-right: 15px;
    }

    .avtaor p {
        font-size: 16px;
        font-weight: bold;
    }

    .remarkName {
        font-size: 12px;
        margin: 2px 0;
    }

    .recordMain,
    .recordMainee {
        height: 80%;
        overflow-y: scroll;
        padding: 5px 15px;
    }

    .recordMain p {
        height: 30px;
        border: 1px solid red;
    }

    #chatRecord .panel .panel-body {
        overflow: unset;
    }

    .staffName {
        margin-top: 30px
    }

    .staffName:last-child {
        margin-bottom: 30px
    }

    .avatar {
        width: 35px;
        height: 35px;
    }

    .timeLeft {
        width: 200px;
        display: none;
        position: absolute;
        left: 0;
        top: -15px;
        font-size: 12px;
        font-family: PingFangSC-Regular, PingFang SC;
        font-weight: 400;
        color: rgba(0, 0, 0, .45);
        line-height: 18px;
        text-align: left;
    }

    .timeRight {
        width: 200px;
        display: none;
        position: absolute;
        right: 0;
        top: -15px;
        font-size: 12px;
        font-family: PingFangSC-Regular, PingFang SC;
        font-weight: 400;
        color: rgba(0, 0, 0, .45);
        line-height: 18px;
        text-align: right;
    }

    .userbox_left {

        display: flex;
        justify-content: left;
        align-items: flex-start;
    }

    .userbox_right {

        display: flex;
        flex-direction: row-reverse;
        justify-content: right;
        align-items: flex-start;
        position: relative;
    }

    .chat_left {
        justify-content: flex-start;
        width: auto;
        height: auto;
        color: #222;
        /* white-space: pre-wrap; */
        word-break: break-word;
        max-width: 80%;
        user-select: text;
        margin-left: 6px;
        position: relative;
        display: flex;
        justify-content: flex-start;
    }

    .chat_right {
        justify-content: flex-start;
        width: auto;
        height: auto;
        color: #fff;
        /* white-space: pre-wrap; */
        word-break: break-word;
        max-width: 80%;
        user-select: text;
        margin-right: 6px;
        position: relative;
        display: flex;
        justify-content: flex-end;
    }

    .chat_left .chatContent {
        width: auto;
        height: auto;
        padding: 5px;
        border-radius: 5px;
        background: #f2f2f2;
        font-size: 14px !important;
        border: 1px solid transparent;
        cursor: pointer;
        margin: 0 auto;
        line-height: 24px;
    }


    .chat_right .chatContent {
        width: auto;
        height: auto;
        padding: 5px;
        border-radius: 5px;
        background: #1992f9;
        font-size: 14px !important;
        border: 1px solid transparent;
        cursor: pointer;
        margin: 0 auto;
        line-height: 24px;
    }

    .boxhover:hover .timeRight {
        display: block;
    }

    .boxhover:hover .timeLeft {
        display: block;
    }

    .abs {
        width: 30%;
        height: 30%;
    }

    .playVideo_left video,
    .playVideo_right video {
        width: 80%;
        height: 80%;
    }

    .playVideo_left {
        display: flex;
        justify-content: flex-start;
    }

    .playVideo_right {
        display: flex;
        justify-content: flex-end;
    }


    .recordFile a {
        display: block;
        cursor: pointer;
        border: 1px solid #e8e8e8;
        padding: 10px;
        width: 260px;
        height: 90px;
        font-size: 12px;
        word-break: break-all;
        color: #909090;
        display: flex;
        justify-content: space-between;
        box-sizing: border-box;
        text-decoration: none
    }

    .recordFile a :hover {
        text-decoration: underline
    }

    .recordFile .fileMain {
        width: 188px;
        display: flex;
        flex-direction: column;
    }

    .FileTitle {
        width: 210px;
        font-weight: bold;
        margin-bottom: 5px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
    }

    .FileSizeLeft {
        text-align: left;
    }

    .FileSizeright {
        text-align: left;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        line-height: 20px;
    }

    .recordFile a img {
        width: 46px;
        height: 46px;
        margin-top: 20px;
        margin-left: 6px;
        -o-object-fit: cover;
        object-fit: cover;
    }

    .viewer-toolbar>ul>li::before {
        margin-top: -3px;
    }

    .viewer-toolbar>ul>.viewer-large::before {
        margin-top: 1px;
    }

    .chat_left .chatVoice {
        height: 40px;
        /* width: 100px; */
        width: auto;
        line-height: 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-sizing: border-box;
        padding: 10px;
        padding-right: 15px;
    }

    .chat_right .chatVoice {
        height: 40px;
        /* width: 100px; */
        width: auto;
        line-height: 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-sizing: border-box;
        padding: 10px;
        padding-right: 15px;

    }

    .chatVoiceImg {
        width: 20px;
        height: 20px;
    }

    .chatVoice p {
        border: 0;
        font-size: 16px;
    }

    .staffTime {
        text-align: center;
        font-size: 14px;
        margin: 35px 0;
        color: #777;
    }

    @keyframes anim-flash {
        0% {
            opacity: 0;
        }

        50% {
            opacity: 0;
        }

        51% {
            opacity: 1;
        }

        100% {
            opacity: 1;
        }
    }

    .playAudioVoice img {
        -webkit-animation: anim-flash 1s infinite;
        animation: anim-flash 1s infinite;
    }

    .window {
        width: 788px;
        left: 50% !important;
        margin-left: -394px;
        top: 0 !important;
    }

    .window-shadow {
        display: none !important;
        width: 788px;
        left: 50% !important;
        margin-left: -394px;
        top: 0 !important;
    }

    .messager-window {
        margin: 0 auto;
        top: 50% !important;
        left: 50% !important;
        margin-top: -80px;
        margin-left: -150px;
    }

    html {
        overflow: auto;
    }



    /* 员工 */

    .userbox_right .userRevoke,
    .userbox_left .userRevoke {
        /* <p class="userRevoke">已撤回 </p> */
        text-align: left;
        height: auto;
        margin-top: 0;
        margin-bottom: 0;
        margin-right: 8px;
        background: #e6f7ff;
        align-self: flex-end;
        border: 0;
        padding: 2px;
        box-sizing: border-box;
    }

    .userbox_left .userRevoke {
        margin-left: 8px;
    }

    .userbox_right .userRevokeImg {
        position: absolute;
        right: 30.5%;
        bottom: 0;
    }

    .userbox_left .userRevokeImg {
        position: absolute;
        left: 30.5%;
        bottom: 0;
    }

    .noUserRevoke {
        display: none;
    }




    .chat_right .chatContent_right,
    .chat_left .chatContent_left {
        width: 260px;
        border: 1px solid #e8e8e8;
        border-radius: 0 4px 4px 8px;
        padding: 8px 0px 0px 8px;
        background: #fff;
    }


    .chatContent_right .chatRecord_title,
    .chatContent_left .chatRecord_title {
        text-align: left;
        border: 0;
        margin: 0;
        color: #909090;
        height: auto;
        font-size: 13px;
    }

    .chatRecord_title:first-child {
        color: #222;
        font-size: 14px;

    }

    .chatRecord_title:nth-child(2) {
        border-bottom: 1px solid #e8e8e8;
        padding-bottom: 3px;
        padding-top: 1px;
    }
</style>





<!-- 获取聊天记录的seq -->
<input class="rowDigseq" type="text" value="" hidden>
<!-- 获取第几行的数据 -->
<input class="rowDigindex" type="text" value="" hidden>
<!-- 储存滚动条的高度 -->
<input class="recordscrollHeight" type="text" value="" hidden>

<img src="" data-original="" alt="" id="hideImg" style="display: none;">

<div id="chatRecord" class="easyui-dialog" title="聊天记录" style="width:800px;height:760px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,">
    <div class="bigbox">
        <div class="headChat">
            <div class="avtaor">
                <img src="" alt="" id="kehuAvtar">
                <p id="kehuName"></p>
            </div>
            <p id="kehuNotes" class="remarkName"></p>
        </div>
        <div class="recordMain" id="recordContent">
        </div>
    </div>
</div>



<div id="chatRecordee" class="easyui-dialog" title="引用的聊天记录" style="width:800px;height:760px;    overflow-y: hidden;"
    data-options="iconCls:'icon-save',resizable:true,modal:true,">
    <div class="bigbox">
        <div class="headChat  headChatee">
            <div id="headTitle">聊天记录</div>
        </div>

        <div class="recordMainee" id="recordContentee">
            <div>你好，这些事聊天记录</div>
        </div>
    </div>
</div>





<script>
    // 客户信息  id 头像  备注名
    var rowInfo = {
        customerid: '',
        qwuserid: '',
        customerphotourl: '',
        photourl: '',
    }

    function onScroll(rowId) {

        var recordContent = document.getElementById('recordContent')
        recordContent.addEventListener('scroll', (e) => {
            //变量scrollTop是滚动条滚动时，距离顶部的距离
            var scrollTop = e.target.scrollTop;
            //变量windowHeight是可视区的高度
            var windowHeight = e.target.clientHeight;
            //变量scrollHeight是滚动条的总高度
            var scrollHeight = e.target.scrollHeight;
            if (scrollTop == 0) {
                $('.recordscrollHeight').val(scrollHeight)
                if (typeof rowInfo.customerid === 'undefined' || typeof rowInfo.qwuserid === 'undefined') {
                    getrecord(rowInfo.customerid, rowInfo.qwuserid, $('.rowDigseq').val(), rowInfo
                        .customerphotourl, rowInfo.photourl)
                } else {
                    getrecord(rowInfo.customerid, rowInfo.qwuserid, $('.rowDigseq').val(), rowInfo
                        .customerphotourl, rowInfo
                        .photourl)
                }

            }
        }, true)
    }


    // 开始聊天记录
    var template = ''

    function getrecord(user1, user2, seq, customerphotourl, photourl) {
        var transdata = {
            user1: user1, //客户
            user2: user2, //员工
            seq: seq
        }
        if (seq == '') {
            $('.recordMain').empty()
        }
        template = ''
        sendRequest("./qwMan/getQwTalkData.do", transdata, function (data) {
            var recordList = JSON.parse(data);
            recordList.reverse()
            if (recordList.length > 0) {
                console.log(recordList)

                for (let i = 0; i < recordList.length; i++) {
                    var aa = i;
                    var upaa = i - 1
                    if (upaa < 0 || upaa == 0) {
                        upaa = 0
                    }
                    var firstTime = Date.parse(recordList[aa].msgtime)
                    var upTime = Date.parse(recordList[upaa].msgtime)
                    var nowTime = Date.parse(new Date())
                    var timestampValue = Math.abs(firstTime - upTime)

                    if (recordList.length < 20 && aa == 0) {
                        template += `
                                <div class='staffName staffTime' >${"${recordList[0].msgtime}"} </div>
                             `
                    }

                    // 大于5分钟小于1天   大于1天小于1周      大于1周
                    if (86400 > timestampValue > 300 || 604800 > timestampValue > 86400 || timestampValue >
                        604800) {
                        template += `
                                <div class='staffName staffTime'>${"${recordList[aa].msgtime}"} </div>
                             `
                    }

                    //  客户模板
                    if (recordList[aa].to == user2) { //条件
                        if (recordList[aa].msgtype == 'text') {
                            recordList[i].text = recordList[i].text.replace(/\n/g, "<br>");
                            template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        	    <div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${recordList[i].msgtime}"}</div>
					        			<p class="chatContent">${"${recordList[i].text}"}   </p>
					        		</div>
                                    <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
                                
					            </div>
					         </div>
					        `;
                        }

                        if (recordList[aa].msgtype == 'image') {
                            template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${recordList[i].msgtime}"}</div>
					        			<img src="https://talk.meihualife.com/${"${recordList[i].text}"}"  onclick="openbigImg('${"${recordList[i].text}"}')"  class='abs' alt="" />
					        		</div>
                                    <p   class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke  userRevokeImg':'noUserRevoke'}"}">已撤回 </p>
					        	</div>
					         </div>
					        `;
                        }
                        if (recordList[aa].msgtype == 'emotion') {
                            template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${recordList[i].msgtime}"}</div>
					        			<img src="https://talk.meihualife.com/${"${recordList[i].text}"}"    onclick="openbigImg('${"${recordList[i].text}"}')"  class='abs' alt="" />
					        		</div>
                                    <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
					        	</div>
                                
					         </div>
						    `;
                        }
                        if (recordList[aa].msgtype == 'file') {
                            var fileData
                            try {
                                if (typeof JSON.parse(recordList[i].text) == "object") {
                                    fileData = JSON.parse(recordList[i].text)
                                }
                            } catch (e) {
                                fileData = {
                                    filesize: '0',
                                    filepath: recordList[i].text,
                                    filename: '',
                                    fileext: ''
                                }
                            }
                            let fileSize = (fileData.filesize / 1048576).toFixed(2)
                            template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${recordList[i].msgtime}"}</div>
					        			<div class="recordFile">
					        				<a href="https://talk.meihualife.com/${"${fileData.filepath}"}"    alt="" target="_blank">
					        					<div class="fileMain">
					        				 <span class="FileTitle">${"${fileData.filename}"}</span>
					        				 <span class="FileSize FileSizeleft">${"${fileSize}"}M</span>
					        			  </div>
					        			   <img src="../../../../images/activity/chatRecord/file.jpg" alt="">
					        				</a>
					        			</div>
					        		</div>
                                    <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
					        	</div>
					         </div>
					        `;
                        }
                        if (recordList[aa].msgtype == 'voice') {
                            var voiceData
                            try {
                                if (typeof JSON.parse(recordList[i].text) == "object") {
                                    voiceData = JSON.parse(recordList[i].text)
                                }
                            } catch (e) {
                                voiceData = {
                                    play_length: '0',
                                    filepath: recordList[i].text,
                                    voice_size: '',
                                }
                            }
                            var playLength = format(voiceData.play_length)
                            template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${recordList[i].msgtime}"}</div>
					        			<div class="chatContent  chatVoice"  onclick="playAudio('${"${voiceData.filepath}"}',this,${"${voiceData.play_length}"})">
					        			  <img src="../../../../images/activity/chatRecord/voice_left.png" alt="" class="chatVoiceImg">
					        				 <p>${"${playLength}"}</p>
					        			</div>
					        		</div>
                                    <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
					        	</div>
					         </div>
					        `;
                        }
                        if (recordList[aa].msgtype == 'video') {
                            template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${recordList[i].msgtime}"}</div>
					        			<div class='playVideo_left'>
					        			<video id="myVideo${"${aa}"}" controls>
					        			  <source src="https://talk.meihualife.com/${"${recordList[i].text}"}" type="video/mp4">
					        			</video>
					        		  </div>
					        		</div>
                                    <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
					        	</div>
					         </div>
					        `;
                        }
                        if (recordList[aa].msgtype == 'link') {
                            var linkData
                            try {
                                if (typeof JSON.parse(recordList[i].text) == "object") {
                                    linkData = JSON.parse(recordList[i].text)
                                }
                            } catch (e) {
                                linkData = {
                                    title: '',
                                    link_url: '',
                                    description: '',
                                    image_url: ''
                                }
                            }
                            if (linkData.image_url == '') {
                                linkData.image_url = '../../../../images/activity/chatRecord/file.jpg'
                            }
                            template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${recordList[i].msgtime}"}</div>
					        			<div class="recordFile">
					        				<a href="${"${linkData.link_url}"}"    alt="" target="_blank">
					        					<div class="fileMain">
					        				 <span class="FileTitle">${"${linkData.title}"}</span>
					        				 <span class="FileSize FileSizeleft">${"${linkData.description}"}</span>
					        			  </div>
					        			   <img src="${"${linkData.image_url}"}" alt="">
					        				</a>
					        			</div>
					        		</div> 
                                     <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
					        	</div>
					         </div>
					        `;
                        }
                        if (recordList[aa].msgtype == 'voiptext') {
                            var voiceData
                            try {
                                if (typeof JSON.parse(recordList[i].text) == "object") {
                                    voiceData = JSON.parse(recordList[i].text)
                                }
                            } catch (e) {
                                voiceData = {
                                    play_length: '0',
                                    filepath: recordList[i].text,
                                    voice_size: '',
                                }
                            }
                            var playLength = format(voiceData.play_length)
                            template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${recordList[i].msgtime}"}</div>
					        			<div class="chatContent  chatVoice">
					        			  <img src="../../../../images/activity/chatRecord/voice_phone.png" alt="" class="chatVoiceImg">
					        				 <p>通话时长${"${playLength}"}</p>
					        			</div>
					        		</div>
					        	</div>
					         </div>
					        `;
                        }

                        if (recordList[aa].msgtype == 'chatrecord') {
                            // recordList[i].text = recordList[i].text.replace(/\n/g, "<br>");
                            var chatrecordData = JSON.parse(recordList[i].text)
                            template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        	    <div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${recordList[i].msgtime}"}</div>
                                        <div class="chatContent  chatContent_left">
                                            <p class='chatRecord_title'>${"${chatrecordData[i].title}"}的聊天记录</p>
                                            <p class='chatRecord_title'>${"${chatrecordData[i].item.length}"}条聊天，点击查看聊天记录内容</p>
                                            <p class='chatRecord_title'>聊天记录</p>
                                        </div>
					        		</div>
                                    <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
                                
					            </div>
					         </div>
					        `;
                        }







                    }


                    // 员工模板
                    if (recordList[aa].to == user1) {
                        if (recordList[aa].msgtype == 'text') {
                            recordList[i].text = recordList[i].text.replace(/\n/g, "<br>");
                            template += `
						     <div class='staffName'> 
						        <div class="userbox_right">
						     	    <img src="${"${photourl}"}" alt="" class="avatar" />
						     	    <div class="pBox boxhover chat_right">
						     		    <div class=" timeRight ">${"${recordList[i].msgtime}"}</div>
						     			<p class="chatContent">${"${recordList[i].text}"} </p>
						     	    </div>
                                     <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
						        </div>
						     </div>	
						     `;
                        }
                        if (recordList[aa].msgtype == 'image') {

                            console.log(recordList[aa].state == "revoke")
                            template += `
						     <div class='staffName'> 
						        <div class="userbox_right">
						     	    <img src="${"${photourl}"}"  alt="" class="avatar" />
						     	    <div class="pBox boxhover chat_right">
						     		    <div class=" timeRight ">${"${recordList[i].msgtime}"}</div>
						     		    <img src="https://talk.meihualife.com/${"${recordList[i].text}"}"     onclick="openbigImg('${"${recordList[i].text}"}')"  class='abs' alt="" />
						     	    </div>
                                     <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke userRevokeImg':'noUserRevoke'}"}">已撤回</p>
						        </div>
						     </div>	
						     `;
                        }
                        if (recordList[aa].msgtype == 'emotion') {

                            template += `
						     <div class='staffName'> 
						        <div class="userbox_right">
						     	    <img src="${"${photourl}"}" 	alt="" class="avatar" />
						     	    <div class="pBox boxhover chat_right">
						     		  <div class=" timeRight ">${"${recordList[i].msgtime}"}</div>
						     		   <img src="https://talk.meihualife.com/${"${recordList[i].text}"}"  onclick="openbigImg('${"${recordList[i].text}"}')"  class='abs' alt="" />
						     	    </div>
                                    <p  class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
                                  </div>
						     </div>	
						    `;
                        }
                        if (recordList[aa].msgtype == 'file') {

                            var fileData
                            try {
                                if (typeof JSON.parse(recordList[i].text) == "object") {
                                    fileData = JSON.parse(recordList[i].text)
                                }
                            } catch (e) {
                                fileData = {
                                    filesize: '0',
                                    filepath: recordList[i].text,
                                    filename: '',
                                    fileext: ''
                                }
                            }
                            // 1 MB(Megabyte)= 1048576 字节(Byte)
                            let fileSize = (fileData.filesize / 1048576).toFixed(2)
                            template += `
						     <div class='staffName'> 
						        <div class="userbox_right">
						     	  <img src="${"${photourl}"}" 	alt="" class="avatar" />
						     	  <div class="pBox boxhover chat_right">
						     		<div class=" timeRight ">${"${recordList[i].msgtime}"}</div>
						     		<div class="recordFile">
						     			<a href="https://talk.meihualife.com/${"${fileData.filepath}"}"    alt="" target="_blank">
						     				<div class="fileMain">
						     			      <span class="FileTitle">${"${fileData.filename}"}</span>
						     			      <span class="FileSize FileSizeright">${"${fileSize}"}M</span>
						     		        </div>
						     		        <img src="../../../../images/activity/chatRecord/file.jpg" alt="">
						     			</a>
						     		</div>
						     	   </div>
                                   <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
						        </div>
						     </div>	
						    `;
                        }
                        if (recordList[aa].msgtype == 'voice') {
                            var voiceData
                            try {
                                if (typeof JSON.parse(recordList[i].text) == "object") {
                                    voiceData = JSON.parse(recordList[i].text)
                                }
                            } catch (e) {
                                voiceData = {
                                    play_length: '0',
                                    filepath: recordList[i].text,
                                    voice_size: '',

                                }
                            }
                            var playLength = format(voiceData.play_length)

                            template += `
						     <div class='staffName'> 
						      <div class="userbox_right">
						     	<img src="${"${photourl}"}" 	alt="" class="avatar" />
						     	<div class="pBox boxhover chat_right">
						     		<div class=" timeRight ">${"${recordList[i].msgtime}"}</div>
						     		<div class="chatContent  chatVoice"  onclick="playAudio('${"${voiceData.filepath}"}',this,${"${voiceData.play_length}"})">
						     		 <p>${"${playLength}"}</p>
						     		 <img src="../../../../images/activity/chatRecord/voice_right.png" alt="" class="chatVoiceImg">
						     		</div>
						     	</div>
                                 <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
						        </div>
						     </div>	
						     `;
                        }
                        if (recordList[aa].msgtype == 'video') {
                            template += `
						     <div class='staffName'> 
						     <div class="userbox_right">
						     	<img src="${"${photourl}"}" 	alt="" class="avatar" />
						     	<div class="pBox boxhover chat_right">
						     		<div class=" timeRight ">${"${recordList[i].msgtime}"}</div>
						     		<div class='playVideo_right'>
						     		<video id="myVideo${"${aa}"}" controls>
						     		  <source src="https://talk.meihualife.com/${"${recordList[i].text}"}" type="video/mp4">
						     		</video>
						     	  </div>
						     	</div>
                                 <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
						        </div>
						     </div>	
						    `;
                        }
                        if (recordList[aa].msgtype == 'link') {

                            var linkData
                            try {
                                if (typeof JSON.parse(recordList[i].text) == "object") {
                                    linkData = JSON.parse(recordList[i].text)
                                }
                            } catch (e) {
                                linkData = {
                                    title: '',
                                    link_url: '',
                                    description: '',
                                    image_url: ''
                                }
                            }
                            if (linkData.image_url == '') {
                                linkData.image_url = '../../../../images/activity/chatRecord/file.jpg'
                            }
                            template += `
                             <div class='staffName'> 
						        <div class="userbox_right">
						     	  <img src="${"${photourl}"}" 	alt="" class="avatar" />
						     	  <div class="pBox boxhover chat_right">
						     		<div class=" timeRight ">${"${recordList[i].msgtime}"}</div>
						     		<div class="recordFile">
						     			<a href="${"${linkData.link_url}"}"    alt="" target="_blank">
						     				<div class="fileMain">
						     			     <span class="FileTitle">${"${linkData.title}"}</span>
						     			     <span class="FileSize FileSizeright">${"${linkData.description}"}</span>
						     		       </div>
						     		      <img src="${"${linkData.image_url}"}"  alt="">
						     			</a>
						     		</div>
						     	</div>
                                 <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
						     </div>
						     </div>
						     `;
                        }

                        if (recordList[aa].msgtype == 'voiptext') {
                            console.log(recordList[aa].msgtype == 'voiptext')
                            var voiceData
                            try {
                                if (typeof JSON.parse(recordList[i].text) == "object") {
                                    voiceData = JSON.parse(recordList[i].text)
                                }
                            } catch (e) {
                                voiceData = {
                                    play_length: '0',
                                    filepath: recordList[i].text,
                                    voice_size: '',

                                }
                            }
                            var playLength = format(voiceData.play_length)

                            template += `
						     <div class='staffName'> 
						      <div class="userbox_right">
						     	<img src="${"${photourl}"}" 	alt="" class="avatar" />
						     	<div class="pBox boxhover chat_right">
						     		<div class=" timeRight ">${"${recordList[i].msgtime}"}</div>
						     		<div class="chatContent  chatVoice"  >
						     		 <p>通话时长${"${playLength}"}</p>
						     		 <img src="../../../../images/activity/chatRecord/voice_phone.png" alt="" class="chatVoiceImg">
						     		</div>
						     	</div>
						        </div>
						     </div>	
						     `;
                        }

                        if (recordList[aa].msgtype == 'chatrecord') {
                            var chatrecordData = JSON.parse(recordList[i].text)
                            console.log(chatrecordData.title)
                            // '${"${JSON.stringify(chatrecordData.item)}"}',
                            template += `
						     <div class='staffName'> 
						        <div class="userbox_right">
						     	    <img src="${"${photourl}"}" alt="" class="avatar" />
						     	    <div class="pBox boxhover chat_right">
						     		    <div class=" timeRight ">${"${recordList[i].msgtime}"}</div>
						     			<div class="chatContent  chatContent_right"   onclick='openchatRecord(${"${JSON.stringify(chatrecordData.item)}"},"${"${chatrecordData.title}"}")'>
                                            <p class='chatRecord_title'>${"${chatrecordData.title}"}的聊天记录</p>
                                            <p class='chatRecord_title'>${"${chatrecordData.item.length}"}条聊天，点击查看聊天记录内容</p>
                                            <p class='chatRecord_title'>聊天记录</p>
                                        </div>
						     	    </div>
                                     <p class="${"${recordList[aa].state&&recordList[aa].state=='revoke'?'userRevoke':'noUserRevoke'}"}">已撤回 </p>
						        </div>
						     </div>	
						     `;
                        }




                    }

                }
                $(template).prependTo($('#recordContent')) //往最前面插入代码
                $('.rowDigseq').val(recordList[0].seq)
                var recordContent = document.getElementById('recordContent')
                if (seq == '') {
                    recordContent.scrollTo(0, recordContent.scrollHeight)
                } else {
                    var nowScrollHeight = recordContent.scrollHeight - $('.recordscrollHeight').val()
                    recordContent.scrollTo(0, nowScrollHeight)
                }
            } else {
                console.log('已经没有记录了')
            }
        }, function () {
            alert('接口出错了')
        });
    }
    // 播放音频
    function playAudio(aa, event, allTime) {

        $('.chatVoice').removeClass("playAudioVoice");
        $(event).addClass("playAudioVoice")
        var dd = 'https://talk.meihualife.com/' + aa
        fetchBlob(dd, function (blob) {
            playAmrBlob(blob);
        });
        var allTime = allTime * 1000
        setTimeout(() => {
            $(event).removeClass("playAudioVoice")
        }, allTime)
    }
    let gAudioContext = new AudioContext();

    function getAudioContext() {
        if (!gAudioContext) {
            gAudioContext = new AudioContext();
        }
        return gAudioContext;
    }

    function fetchBlob(url, callback) {
        let xhr = new XMLHttpRequest();
        xhr.open('GET', url);
        xhr.responseType = 'blob';
        xhr.onload = function () {
            callback(this.response);
        };
        xhr.onerror = function () {
            alert('Failed to fetch ' + url);
        };
        xhr.send();
    }

    function readBlob(blob, callback) {
        const reader = new FileReader();
        reader.onload = function (e) {
            const data = new Uint8Array(e.target.result);
            callback(data);
        };
        reader.readAsArrayBuffer(blob);
    }

    function playAmrBlob(blob, callback) {
        readBlob(blob, function (data) {
            playAmrArray(data);
        });
    }

    function playAmrArray(array) {
        const samples = AMR.decode(array);
        if (!samples) {
            alert('播放失败，请下载后播放!');
            return;
        }
        playPcm(samples);
    }
    let preCtx = null;

    function playPcm(samples) {
        if (preCtx !== null) {
            stopPlay();
        }
        const ctx = getAudioContext();
        const src = ctx.createBufferSource();
        const buffer = ctx.createBuffer(1, samples.length, 8000);
        if (buffer.copyToChannel) {
            buffer.copyToChannel(samples, 0, 0);
        } else {
            const channelBuffer = buffer.getChannelData(0);
            channelBuffer.set(samples);
        }
        src.buffer = buffer;
        src.connect(ctx.destination);
        src.start();
        preCtx = src;
    }
    //停止播放
    function stopPlay() {
        if (preCtx !== null) {
            preCtx.stop();
        }
        preCtx = null;
    }


    function openbigImg(bb) {
        document.getElementById('hideImg').src = 'https://talk.meihualife.com/' + bb
        document.getElementById('hideImg').setAttribute("data-original", 'https://talk.meihualife.com/' + bb);
        var itemId = document.getElementById('hideImg').getAttribute("data-original");

        var viewer = new Viewer(document.getElementById('hideImg'), {
            url: 'data-original',
            zIndex: '9999',
            show: function () { // 动态加载图片后，更新实例
                viewer.update();
            },
        });
        document.getElementById('hideImg').click()
    }

    function openChatDlg(index, rowId) {
        // 清空聊天记录和里面的标签
        template = ''
        $('.recordMain').empty()
        // seq聊天记录编号清空
        $('.rowDigseq').val(' ')

        var rows = $("#" + rowId).datagrid('getRows'); //获取所有当前加载的数据行
        var row = rows[index];
        rowInfo = row

        if (typeof row.customerid === 'undefined' || typeof row.qwuserid === 'undefined') {
            openinfo(row).then((row) => {

                getrecord(row.customerid, row.qwuserid, '', row.customerphotourl, row.photourl)
                // 设置顶部头像姓名备注名
                $("#kehuAvtar").attr('src', row.customerphotourl)
                $("#kehuName").text(row.customername)
                $("#kehuNotes").text("备注名：" + typeof row.customerremarkname === 'undefined' ? '备注名：' : "备注名：" +
                    row.customerremarkname)
                $('#chatRecord').dialog('open');
            })
        } else {
            getrecord(row.customerid, row.qwuserid, '', row.customerphotourl, row.photourl)
            // 设置顶部头像姓名备注名
            $("#kehuAvtar").attr('src', row.customerphotourl)
            $("#kehuName").text(row.customername)
            $("#kehuNotes").text(typeof row.customerremarkname == 'undefined' ? '备注名：' : "备注名：" + row
                .customerremarkname)
            $('#chatRecord').dialog('open');

        }

        $('.rowDigindex').val(index)


    };

    function openinfo(row) {
        var transdata = {
            mobile: row.mobilestr,
            userid: row.userid,
        }
        var userName = row.name
        return new Promise((resolve, reject) => {
            sendRequest("./qwMan/getQwtalkInfoByMobile.do", transdata, function (data) {
                if (data == "null") {

                    $.messager.alert('执行失败', ' 请确定业务员是否添加了客户微信？', 'error');
                    return
                } else {
                    var data = JSON.parse(data);
                    rowInfo.customerid = data.customerid
                    rowInfo.qwuserid = data.qwuserid
                    rowInfo.customerphotourl = data.customerphotourl
                    rowInfo.photourl = data.photourl
                    rowInfo.customerremarkname = data.customer_remark_name
                    // row.customername = data.username
                    row.customername = userName
                    resolve(row)
                }
            })
        });





    }
    // 时间格式8转化为00：08
    function format(seconds) {
        let hour = Math.floor(seconds / 3600) >= 10 ? Math.floor(seconds / 3600) : '0' + Math.floor(seconds / 3600);
        seconds -= 3600 * hour;
        let min = Math.floor(seconds / 60) >= 10 ? Math.floor(seconds / 60) : '0' + Math.floor(seconds / 60);
        seconds -= 60 * min;
        let sec = seconds >= 10 ? seconds : '0' + seconds;
        return min + ':' + sec;
    };


    // 打开聊天记录
    function openchatRecord(data, headTitle) {
        $("#headTitle").text(headTitle + '的聊天记录')
        $('.recordMainee').empty()
        getQwTalkFile(data)
    }

    // 获取聊天记录中的文件
    function getQwTalkFile(data) {
        var paramData = ''
        for (let i = 0; i < data.length; i++) {
            if (data[i].type == 'ChatRecordFile' || data[i].type == 'ChatRecordImage' || data[i].type ==
                'ChatRecordVideo') {
                var dd = JSON.parse(data[i].content)
                paramData += dd.md5sum + ','
            }
        }
        var transdata = {
            fileid: paramData
        }
        sendRequest("./qwMan/getQwTalkFile.do", transdata, function (dataPath) {
            var dataPath = JSON.parse(dataPath)
            if (dataPath.length > 0) {
                for (let i = 0; i < data.length; i++) {
                    for (let j = 0; j < dataPath.length; j++) {
                        if (JSON.parse(data[i].content).md5sum == dataPath[j].id) {
                            data[i].filepath = dataPath[j].text
                        }
                    }
                }
                chatRecordTemplate(data)
            }
        })

    }

    function chatRecordTemplate(recordData) {
        var template = ''
        var customerphotourl = "../../../../images/activity/chatRecord/LOGO.png"
        for (let i = 0; i < recordData.length; i++) {

            if (recordData[i].type == 'ChatRecordText') {
                var main = JSON.parse(recordData[i].content)
                var mainText = main.content.replace(/\n/g, "<br>");
                var dataTime = timestampToTime(recordData[i].msgtime)
                template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        	    <div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${dataTime}"}</div>
					        			<p class="chatContent">${"${mainText}"}   </p>
					        		</div>
					            </div>
					         </div>
					        `;
            }
            if (recordData[i].type == 'ChatRecordImage') {
                var dataTime = timestampToTime(recordData[i].msgtime)
                template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${dataTime}"}</div>
					        			<img src="https://talk.meihualife.com/${"${recordData[i].filepath}"}"  onclick="openbigImg('${"${recordData[i].filepath}"}')"  class='abs' alt="" />
					        		</div>
                                 
					        	</div>
					         </div>
					        `;
            }
            if (recordData[i].type == 'ChatRecordEmotion') {
                var dataTime = timestampToTime(recordData[i].msgtime)
                template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${dataTime}"}</div>
					        			<img src="https://talk.meihualife.com/${"${recordData[i].filepath}"}"    onclick="openbigImg('${"${recordData[i].filepath}"}')"  class='abs' alt="" />
					        		</div>
                                 
					        	</div>
                                
					         </div>
						    `;
            }
            if (recordData[i].type == 'ChatRecordFile') {
                var dataTime = timestampToTime(recordData[i].msgtime)
                var fileData
                console.log(recordData[i].content)
                try {
                    if (typeof JSON.parse(recordData[i].content) == "object") {
                        fileData = JSON.parse(recordData[i].content)

                    }
                } catch (e) {
                    fileData = {
                        filesize: '0',
                        filepath: recordData[i].content,
                        filename: '',
                        fileext: ''
                    }
                }
                console.log(fileData)
                let fileSize = (fileData.filesize / 1048576).toFixed(2)
                template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${dataTime}"}</div>
					        			<div class="recordFile">
					        				<a href="https://talk.meihualife.com/${"${recordData[i].filepath}"}"    alt="" target="_blank">
					        					<div class="fileMain">
					        				 <span class="FileTitle">${"${fileData.filename}"}</span>
					        				 <span class="FileSize FileSizeleft">${"${fileSize}"}M</span>
					        			  </div>
					        			   <img src="../../../../images/activity/chatRecord/file.jpg" alt="">
					        				</a>
					        			</div>
					        		</div>
                                
					        	</div>
					         </div>
					        `;
            }

            if (recordData[i].type == 'ChatRecordVoice') {
                var dataTime = timestampToTime(recordData[i].msgtime)
                var voiceData
                try {
                    if (typeof JSON.parse(recordData[i].content) == "object") {
                        voiceData = JSON.parse(recordData[i].content)
                    }
                } catch (e) {
                    voiceData = {
                        play_length: '0',
                        filepath: recordData[i].content,
                        voice_size: '',
                    }
                }
                var playLength = format(voiceData.play_length)
                template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${dataTime}"}</div>
					        			<div class="chatContent  chatVoice"  onclick="playAudio('${"${recordData[i].filepath}"}',this,${"${voiceData.play_length}"})">
					        			  <img src="../../../../images/activity/chatRecord/voice_left.png" alt="" class="chatVoiceImg">
					        				 <p>${"${playLength}"}</p>
					        			</div>
					        		</div>
                                 
					        	</div>
					         </div>
					        `;
            }

            if (recordData[i].type == 'ChatRecordVideo') {
                var dataTime = timestampToTime(recordData[i].msgtime)
                template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${dataTime}"}</div>
					        			<div class='playVideo_left'>
					        			<video id="myVideo${"${aa}"}" controls>
					        			  <source src="https://talk.meihualife.com/${"${recordData[i].filepath}"}" type="video/mp4">
					        			</video>
					        		  </div>
					        		</div>
					        	</div>
					         </div>
					        `;
            }
            if (recordData[i].type == 'ChatRecordLink') {
                var dataTime = timestampToTime(recordData[i].msgtime)
                var linkData
                try {
                    if (typeof JSON.parse(recordData[i].content) == "object") {
                        linkData = JSON.parse(recordData[i].content)
                    }
                } catch (e) {
                    linkData = {
                        title: '',
                        link_url: '',
                        description: '',
                        image_url: ''
                    }
                }
                if (linkData.image_url == '') {
                    linkData.image_url = '../../../../images/activity/chatRecord/file.jpg'
                }
                template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${dataTime}"}</div>
					        			<div class="recordFile">
					        				<a href="${"${linkData.link_url}"}"    alt="" target="_blank">
					        					<div class="fileMain">
					        				 <span class="FileTitle">${"${linkData.title}"}</span>
					        				 <span class="FileSize FileSizeleft">${"${linkData.description}"}</span>
					        			  </div>
					        			   <img src="${"${linkData.image_url}"}" alt="">
					        				</a>
					        			</div>
					        		</div> 
                                    
					        	</div>
					         </div>
					        `;
            }
            if (recordData[i].type == 'ChatRecordVoiptext') {
                var dataTime = timestampToTime(recordData[i].msgtime)
                var voiceData
                try {
                    if (typeof JSON.parse(recordData[i].content) == "object") {
                        voiceData = JSON.parse(recordData[i].content)
                    }
                } catch (e) {
                    voiceData = {
                        play_length: '0',
                        filepath: recordData[i].content,
                        voice_size: '',
                    }
                }
                var playLength = format(voiceData.play_length)
                template += `
					         <div class='staffName'> 
					        	<div class="userbox_left">
					        		<img src="${"${customerphotourl}"}" alt="" class="avatar" />
					        		<div class="pBox boxhover chat_left">
					        			<div class="timeLeft">${"${dataTime}"}</div>
					        			<div class="chatContent  chatVoice">
					        			  <img src="../../../../images/activity/chatRecord/voice_phone.png" alt="" class="chatVoiceImg">
					        				 <p>通话时长${"${playLength}"}</p>
					        			</div>
					        		</div>
					        	</div>
					         </div>
					        `;
            }

        }

        $(template).prependTo($('#recordContentee')) //往最前面插入代码
        $('#chatRecordee').dialog('open');
    }






    function timestampToTime(timestamp) {
        var date = new Date(timestamp * 1000); // 时间戳精确到毫秒
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        var hour = date.getHours();
        var minute = date.getMinutes();
        var second = date.getSeconds();
        return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
    }

    function sendRequest(url, data, success, error) {
        $.ajax({
            url: url,
            type: "post",
            async: true,
            data: data ? data : {},
            beforeSend: function () {
                $(".loading").show();
            },
            success: function (data) {
                if (success) {
                    success(data);
                }
            },
            error: function (data) {
                if (error) {
                    error(data);
                }
            },
            complete: function () {
                $(".loading").hide();
            }
        });
    }



    // 结束
</script>

<script>
    var cc = {
        "item": [{
            "from_chatroom": false,
            "msgtime": 1709000602,
            "type": "ChatRecordText",
            "content": "{\"content\":\"复星保德信人寿\u2014\u2014大黄蜂10号（旗舰版）\\n风险综合偿付能力：175.54%\\n\\n以50万为例演示\\n等待期：180天\\n基础配置保障详情：\\n重疾：125种x1次，赔付100%，赔付50万\\n\\n【自带】高发特定重疾+高发罕见重疾超额赔付：\\n高发罕见重疾超额赔付\\n20种特定重疾赔付：\\n第一年额外赔付60%，第二年120%，第三年及以后150%\\n20种罕见重疾赔付：\\n第一年额外赔付100%，第二年200%，第三年220%\\n如第2-4次重疾确诊约定的20种少儿特疾/20种少儿罕见病\\n在给付重疾多次保险金的同时，额外赔付100%，行业首创[强]\\n\\n亮点：重疾赔完轻症和中症责任可以继续赔付\\n中症：30种，与轻症共享6次，不分组、无间隔，\\n[红包]依次按照60%赔付30万。\\n轻症：43种，与中症共享6次，不分组、无间隔\\n[红包]依次按照30%赔付15万。\\n重度拓展保险金：先发生原位癌或轻度-恶性肿瘤理赔轻症后，\\n首次重疾发生重度-恶性肿瘤，额外赔付50%\\n\\n保费豁免功能：被保人3重豁免+投保人5重豁免\\n\\n【自带】被保人：\\n⭕轻症先理赔，后免交保险费，保障继续；\\n⭕中症先理赔，后免交保险费，保障继续；\\n⭕重疾先理赔，后免交保险费，保障继续。\\n\\n现金价值（详见合同）：\\n退保的时候能退回来的钱；未患重症前提下，退保可返现金价值。\\n\\n-----------------------\\n可选附加保障介绍：\\n【按需附加】身故赔保额：100%赔付50万；\\n[爱心]建议：预算充足者/想100%拿回本金者可选。\\n\\n【建议附加】癌症二次赔：无限次，给付40%/50%/30%基本保额\\n此后每间隔3年仍处于恶性肿瘤状态给付50%（新发/复发/持续/转移/扩散）\\n癌→癌：间隔1年；非癌→癌：间隔180天\\n[爱心]建议：预算充足，家族有患癌史者可选。\\n\\n【建议附加】重疾多次给付保险金：第二次120%，第三次120%，第四次150%\\n⭕重疾额外赔付3次不分组，非癌→癌间隔期180天，其他间隔期1年\\n[爱心]建议：小孩生命周期比较长，避免小的时候万一理赔过重疾，成人的时候重疾保障就没有了，预算允许，建议附加\\n \\n【建议附加】投保人豁免：\\n⭕确诊轻症/中症/重疾/身故/全残，免交后期未缴的所有保险费，但是孩子保障继续。\"}"
        }, {
            "from_chatroom": false,
            "msgtime": 1709000695,
            "type": "ChatRecordFile",
            "content": "{\"md5sum\":\"5170FC0A637DF4A9B7D5885DB5D3DD9B\",\"filename\":\"复星保德信公司介绍.pptx\",\"fileext\":\"pptx\",\"filesize\":38461472,\"sdkfileid\":\"Cu8DKjEqSmVRYVM3cDl4eUJ6WkRNaTdjRTRFUlpnWUU5V0J4UVNUV0xrYjNHVFNJNWMxYTlCaE1seEZ6WjlBbWpqcElIandCL3FZaE5IcDRLUG9HcFRvcDNJa1VVWUdvR0I0dUhqZmsrV1VLWlNBaEZGdERRV1BqaCtrZDM3ZEpyMHVkL21XWDBuZTk0elpuL2lITVZ5c0VYSC80eW9NRXlVSXhaVU5kL0o0VWVpdTlTY21VU2hpMEc1RGpOazF2QzBBN0VRTHdMZVNaK0dmTm1TUDZUekwvNU1Pc3dudmR2eG1hUGljd29rTnZ2SGdRYTM3Znd0M0Z6eXB3V3lIOXp5K09MQk9Ca3RZV3hoRVVCRXNCYjNHUkNVbC82V3NOZmwzNlpacWN1a3ZpaDVhR2RoMklhZXErNGp0cSs0QUZYb1NHaVh0NFFodTl3cDJnai92Sk5iWHNoQysxOWk0Wk8zZnpBODdoR0hvaGxUbmh4d1VrRDJOVE1paUtxMVRlOUl5SncydTAyVnRQeXhoQmFBcmdoSktEZHRaTHZpZ2o2Y1Y1dkYwRHgzYU5KYTFhK0M0dzY2QnJ3NklycHdjVW1nR3hjUDdZUTFmekFwVnlaaVVHalREdDZSNUlIUlFEdEtUS3dGNFcvaG5MeEM2Um89EjhORGRmTVRZNE9EZzFOelV6TlRRMU1UZzVORjg0TXpBNU5EY3lNVGhmTVRjd09URXdNVFV4Tnc9PRogNzg3ODc0Nzc2ZDY2NmI2NTY1Njk3NDc3Njg2ODZhNjk=\"}"
        }, {
            "from_chatroom": false,
            "msgtime": 1709000699,
            "type": "ChatRecordFile",
            "content": "{\"md5sum\":\"8ea4ba6f8f788d345d2928e5a8a23c15\",\"filename\":\"复星保德信大黄蜂10号少儿重疾险（旗舰版）.pptx\",\"fileext\":\"pptx\",\"filesize\":2064283,\"sdkfileid\":\"CqwCMzA4MTkzMDIwMTAyMDQ4MThiMzA4MTg4MDIwMTAwMDIwNGM5N2ExMmY2MDIwMzBmNDI0MTAyMDQ2YzdhNTg3NTAyMDQ2NWRkNDdmYjA0NGM0ZTQ1NTc0OTQ0MzE1ZjYzMzkzNzYxMzEzMjY2MzYzNjYzMzc2MTM1MzgzNzM1MzYzNTY0NjU2NDMxNjMzOTMwMzAzMDM3NjE2MjY1MzM1ZjY1MzEzMTY0NjE2NTM5MzIyZDM4NjU2NDYzMmQzNDYzNjQzNTJkNjE2NDYyMzUyZDY1NjI2NDYzMzEzOTYyMzAzMDMzNjIzODAyMDEwMDAyMDMxZjdmYTAwNDEwOGVhNGJhNmY4Zjc4OGQzNDVkMjkyOGU1YThhMjNjMTUwMjAxMDUwMjAxMDAwNDAwEjhORGRmTVRZNE9EZzFOelV6TlRRMU1UZzVORjh4TmprNU1UVXdOamcwWHpFM01Ea3hNREUxTVRjPRogMzYzNDY2MzE2MjMwMzkzODYyMzQzMzY0MzEzNTM5MzY=\"}"
        }, {
            "from_chatroom": false,
            "msgtime": 1709000704,
            "type": "ChatRecordFile",
            "content": "{\"md5sum\":\"e01115e8b19a79840676359b4eb58ad9\",\"filename\":\"大黄蜂10号（旗舰版）健康管理服务手册.doc\",\"fileext\":\"doc\",\"filesize\":22528,\"sdkfileid\":\"CqoCMzA4MTkyMDIwMTAyMDQ4MThhMzA4MTg3MDIwMTAwMDIwNGM5N2ExMmY2MDIwMzBmNDI0MTAyMDQ2YzdhNTg3NTAyMDQ2NWRkNDgwMDA0NGM0ZTQ1NTc0OTQ0MzE1ZjYzMzkzNzYxMzEzMjY2MzYzNjYzMzc2MTM1MzgzNzM1MzYzNTY0NjU2NDMxNjMzOTMwMzAzMDMzMzc2NDYyMzI1ZjMxMzQ2NjY0NjU2MTMzMzgyZDMzNjEzNjM2MmQzNDY2MzIzNDJkMzgzMjM5MzYyZDM1MzEzNDM5MzA2MjMwNjY2MzMwMzIzOTAyMDEwMDAyMDI1ODEwMDQxMGUwMTExNWU4YjE5YTc5ODQwNjc2MzU5YjRlYjU4YWQ5MDIwMTA1MDIwMTAwMDQwMBI4TkRkZk1UWTRPRGcxTnpVek5UUTFNVGc1TkY4eE1qSXhNelF3TnpBNFh6RTNNRGt4TURFMU1UYz0aIDM0NjUzNDM3NjU2NDM1MzU2NjMwMzEzNDY0MzkzMjM1\"}"
        }],
        "title": "刘晶晶(刘老师理财和保障高级规划师)"
    }
</script>