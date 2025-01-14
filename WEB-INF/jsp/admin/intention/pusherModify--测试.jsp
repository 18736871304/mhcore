<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
	<title></title>
	<link href="https://unpkg.com/@wangeditor/editor@latest/dist/css/style.css" rel="stylesheet">

	<style>
		#editor—wrapper {
			border: 1px solid #ccc;
			z-index: 100;
			/* 按需定义 */
		}

		#toolbar-container {
			border-bottom: 1px solid #ccc;
		}

		#editor-container {
			height: 500px;
		}

		#header-container {
			list-style-type: none;
			0 padding-left: 20px;
		}

		#header-container li {
			color: #333;
			margin: 10px 0;
			cursor: pointer;
		}

		.w-e-bar-item span {
			font-size: unset;
		}

		#header-container li:hover {
			text-decoration: underline;
		}

		h1 span {
			font-size: 32px;
			font-weight: bold;
		}


		h2 span {
			font-size: 24px;
			padding-left: 15px;
			font-weight: bold;
		}


		h3 span {
			font-size: 18px;
			padding-left: 30px;
		}


		h4 span {
			font-size: 16px;
			padding-left: 45px;
		}


		h5 span {
			font-size: 12px;
			padding-left: 60px;
		}
	</style>
	<!-- cw\articleMan\css\article-manage.css -->
	<link rel="stylesheet" href="../../../../cw/articleMan/css/index.css">
	<!-- <link rel="stylesheet" href="../../../../cw/articleMan/css/article-manage.css"> -->
	<!-- <link rel="stylesheet" href="../../../../css/inputbox/line6.css"> -->
	<style>
		/* [v-cloak] {
			display: none;
		} */

		.el-table--border th.gutter:last-of-type {
			display: block !important;
		}
	</style>

</head>
<!-- <%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%> -->

<body>


	<div class="container customerManagement" id="container" v-cloak>
		<!-- <div class="contentBox">
			<div class="header">
				<div class="add-btn button-img" @click="createArticle">
					+ 新建
				</div>
				<div class="box1 commonBox">
					<div class="box1_div">
						<div class="box1_div_l">文章名称</div>
						<el-input v-model="title" size="mini" placeholder=""></el-input>
					</div>
					<div class="box1_div">
						<div class="box1_div_l">渠道</div>
						<el-select v-model="channel" size="mini" placeholder="">
							<el-option v-for="(item,index) in channelList" :key="index" :label="item.dd_value"
								:value="item.dd_key">
							</el-option>
						</el-select>
					</div>
					<div class="search btn button-img" @click="search">搜索</div>
					<div class="search btn button-img" @click="reset">重置</div>
				</div>
			</div>
			<div class="footer">
				<div class="tableBox">
					<el-table :data="tableData" border style="width: 100%">
						<el-table-column align="center" prop="title" label="标题">
						</el-table-column>
						<el-table-column align="center" prop="channelname" label="渠道">
						</el-table-column>
						<el-table-column align="center" prop="updatetime" label="更新时间">
						</el-table-column>
						<el-table-column align="center" label="操作" width="250px">
							<template slot-scope="scope">
								<a class="edit option" target="_blank"
									:href="'http://www.meihualife.com/clue/cw/index.html?uuid=' + scope.row.uuid">预览</a>
								<a class="edit option" href="javascript:void(0);" @click="editItem(scope.row)">编辑</a>
								<a class="delete option" href="javascript:void(0);"
									@click="deleteItem(scope.row)">删除</a>
							</template>
						</el-table-column>
					</el-table>
				</div>
				<div class="pageBox">
					<el-pagination background layout="prev, pager, next" :total="pageTotal" :page-size="pageSize"
						:current-page="pageNum" @current-change="pageClick">
					</el-pagination>
				</div>
			</div>
		</div> -->
		<el-dialog :title="txt" :visible.sync="false" width="1300px" :destroy-on-close="true"  style="display: block;">
			<div class="article-box">
				<!-- <div class="content-section">
					<div class="item-section">
						<label>标题</label>
						<div class="right-content">
							<el-input v-model="articleTitle" size="mini" placeholder=""></el-input>
						</div>
					</div>
					<div class="item-section">
						<label>渠道</label>
						<div class="right-content">
							<el-select v-model="articleChannel" size="mini" placeholder="">
								<el-option v-for="(item,index) in channelList" :key="index" :label="item.dd_value"
									:value="item.dd_key">
								</el-option>
							</el-select>
						</div>
					</div>
				</div> -->



				<!-- 编辑器 -->
				<div>
					<div id="editor—wrapper">
						<div id="toolbar-container">
							<!-- 工具栏 -->
						</div>
						<div id="editor-container">
							<!-- 编辑器 -->
						</div>
					</div>

					<textarea id="editor-content-textarea"
						style="width: 100%; height: 100px; outline: none;"></textarea>

					<div style="margin-top: 10px;">
						<button id="btn-set-html">Set HTML</button>
					</div>

					<div style="margin-top: 20px;">
						<textarea id="editor-content-textarea1" style="width: 100%; height: 100px; outline: none;"
							readonly=""></textarea>
					</div>

				</div>









				<div class="dialog-footer">
					<div class="btn cancel" @click="dialog = false">取消</div>
					<div class="btn next" @click="save">{{txt}}</div>
				</div>
			</div>
		</el-dialog>
	</div>





	<!-- <div id="editor-content-view" class="editor-content-view">
		<p>hello world</p>
		<p><br></p>
	</div> -->







	<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://unpkg.com/@wangeditor/editor@latest/dist/index.js"></script>
	<!-- <script src="../../../../cw/articleMan/js/element-ui.js"></script> -->
	<script>
		const {
			createEditor,
			createToolbar
		} = window.wangEditor

		const editorConfig = {
			MENU_CONF: {},
			placeholder: 'Type here...',
			onChange(editor) {
				const html = editor.getHtml()
				console.log('editor content', html)
				// 也可以同步到 <textarea>
				// document.getElementById('editor-content-view').innerHTML = html
				document.getElementById('editor-content-textarea1').value = html
			}
		}


		editorConfig.MENU_CONF['uploadImage'] = {
			// server: 'https://insure.meihualife.com/impUpload.do',
			// server: '/api/upload-img-10s', // test timeout
			// server: '/api/upload-img-failed', // test failed
			// server: '/api/xxx', // test 404

			server: "https://crm.meihualife.com/crm/fileupload/impUpload.do",

			timeout: 5 * 1000, // 5s

			fieldName: 'myFile',
			meta: {
				// token: 'xxx',
				// a: 100
			},
			metaWithUrl: true, // join params to url
			headers: {
				Accept: 'text/x-json'
			},

			maxFileSize: 10 * 1024 * 1024, // 10M

			base64LimitSize: 5 * 1024, // insert base64 format, if file's size less than 5kb

			onBeforeUpload(file) {
				console.log('onBeforeUpload', file)

				return file // will upload this file
				// return false // prevent upload
			},
			onProgress(progress) {
				console.log('onProgress', progress)
			},
			onSuccess(file, res) {
				console.log('onSuccess', file, res)
			},
			onFailed(file, res) {
				alert(res.message)
				console.log('onFailed', file, res)
			},
			onError(file, err, res) {
				alert(err.message)
				console.error('onError', file, err, res)
			},


		}


		editorConfig.MENU_CONF['uploadVideo'] = {
			server: 'https://insure.meihualife.com//impUpload.do',
		}





		const editor = createEditor({
			selector: '#editor-container',
			// selector: '#editor-container',
			html: '<p><br></p>',
			config: editorConfig,
			mode: 'default', // or 'simple'
		})

		const toolbarConfig = {}

		const toolbar = createToolbar({
			editor,
			selector: '#toolbar-container',
			// selector: '#toolbar-container',
			config: toolbarConfig,
			mode: 'default', // or 'simple'
			// mode: 'simple', // or 'default'
		})




		const E = window.wangEditor

		// 切换语言
		const LANG = location.href.indexOf('lang=en') > 0 ? 'en' : 'zh-CN'
		E.i18nChangeLanguage(LANG)

		// // 标题 DOM 容器
		// const headerContainer = document.getElementById('header-container')
		// headerContainer.addEventListener('mousedown', event => {
		// 	if (event.target.tagName !== 'LI') return
		// 	event.preventDefault()
		// 	const id = event.target.id
		// 	editor.scrollToElem(id) // 滚动到标题
		// })

		// textarea 初始化值
		const textarea = document.getElementById('editor-content-textarea')
		textarea.value =
			'<p>wangEditor 只识别 editor.getHtml() 生成的 html 格式，不可以随意自定义 html 代码（html 格式太灵活了，不会全部兼容）</p>\n<p>wangEditor can only understand the HTML format from editor.getHtml() , but not all HTML formats.</p>\n<p><br></p>'

		// Set HTML
		document.getElementById('btn-set-html').addEventListener('click', () => {
			if (editor.isDisabled()) editor.enable()
			if (!editor.isFocused()) editor.focus()

			editor.select([])
			editor.deleteFragment()

			E.SlateTransforms.setNodes(editor, {
				type: 'paragraph'
			}, {
				mode: 'highest'
			})
			editor.dangerouslyInsertHtml(textarea.value)
		})
	</script>
</body>

</html>