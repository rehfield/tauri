#!/bin/bash

# 定义 ipynb 文件数组
ipynbFiles=(
  "cuda_6_1.ipynb"
  "cuda_6_2.ipynb"
  "cuda_6_3.ipynb"
  "cuda_44_1.ipynb"
  "cuda_44_2.ipynb"
  "cuda_44_3.ipynb"
  "cuda_74_1.ipynb"
  "cuda_74_2.ipynb"
  "cuda_74_3.ipynb"
  "cuda_114_1.ipynb"
  "cuda_114_2.ipynb"
  "cuda_114_3.ipynb"
  "cuda_136_1.ipynb"
  "cuda_136_2.ipynb"
  "cuda_136_3.ipynb"
  "cuda_163_1.ipynb"
  "cuda_163_2.ipynb"
  "cuda_163_3.ipynb"
  "cuda_211_1.ipynb"
  "cuda_211_2.ipynb"
  "cuda_211_3.ipynb"
  "cuda_227_1.ipynb"
  "cuda_227_2.ipynb"
  "cuda_227_3.ipynb"
  "cuda_235_1.ipynb"
  "cuda_235_2.ipynb"
  "cuda_235_3.ipynb"
)

# 模板文件
template="tpl.ipynb"

# 检查模板文件是否存在
if [[ ! -f "$template" ]]; then
  echo "模板文件 $template 不存在！"
  exit 1
fi

# 遍历数组，根据模板生成文件
for file in "${ipynbFiles[@]}"; do
  # 去掉 .ipynb 后缀，得到 cuda_name
  cuda_name="${file%.ipynb}"
  
  # 如果目标文件已存在，则删除，强制覆盖
  if [[ -f "$file" ]]; then
    rm -f "$file"
  fi
  
  # 使用 sed 将模板中所有的 cuda_name 替换为目标值，并写入新文件
  sed "s/cuda_name/${cuda_name}/g" "$template" > "$file"
  
  echo "生成文件：$file (cuda_name 替换为 ${cuda_name})"
done
