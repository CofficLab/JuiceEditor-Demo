#!/bin/bash

# 监控的目录
watch_dir="public/juice-editor/assets"

# index.html 文件路径
index_file="index.html"

update_index() {
    # 获取最新的 JS 和 CSS 文件名
    js_file=$(ls -t $watch_dir/index-*.js | head -n1 | xargs basename)
    css_file=$(ls -t $watch_dir/index-*.css | head -n1 | xargs basename)

    echo "js_file: $js_file"
    echo "css_file: $css_file"

    # 检测操作系统类型
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macOS"
        # macOS
        sed -i '' "s/index-[0-9a-f]*\.js/$js_file/g" $index_file
        sed -i '' "s/index-[0-9a-f]*\.css/$css_file/g" $index_file
    else
        # Linux 和其他系统
        sed -i "s/index-[0-9a-f]*\.js/$js_file/g" $index_file
        sed -i "s/index-[0-9a-f]*\.css/$css_file/g" $index_file
    fi

    echo "已更新 index.html 中的文件引用"
}

# 初始更新
update_index
