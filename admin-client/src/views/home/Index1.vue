<script lang="ts" setup>
import { reactive } from "vue";
import AppIcon from "@/core/components/AppIcon.vue";
import hzyImg from "@/assets/hzy.jpg";

const state = reactive({
  imgPath: hzyImg,
  deadline: Date.now() + 1000 * 60 * 60 * 24 * 2 + 1000 * 30,
});

function onFinish() {
  console.log("over");
}
</script>

<template>
  <div>
    <a-card style="width: 100%; border: 0" class="mb-16">
      <a-row :gutter="[16, 16]">
        <a-col :xs="24" :sm="24" :md="8" :lg="8" :xl="8">
          <a-row type="flex">
            <a-col :span="8" :order="1">
              <a-badge :count="666">
                <a-avatar :size="100" :src="state.imgPath" />
              </a-badge>
            </a-col>
            <a-col :span="16" :order="2">
              <div class="fs-16">
                <a target="_black" href="https://gitee.com/hzy6" class="text-cyan">HZY</a>
              </div>
              <div class="fs-16">
                <a target="_black" href="https://gitee.com/hzy6/hzy-admin-spa-ui" class="text-blue">源码</a>
              </div>
              <div class="fs-16">
                <a target="_black" href="https://next.antdv.com/components/overview-cn" class="text-danger">组件官网：Ant Design Vue</a>
              </div>
            </a-col>
          </a-row>
        </a-col>
        <a-col :xs="24" :sm="24" :md="16" :lg="16" :xl="16">
          <a-row :gutter="[16, 16]">
            <a-col :span="8" class="text-center">
              <a-statistic title="Stars" :value="747">
                <template #suffix>
                  <AppIcon name="StarOutlined" />
                </template>
              </a-statistic>
            </a-col>
            <a-col :span="8" class="text-center">
              <a-statistic title="Watch" :value="172">
                <template #suffix>
                  <AppIcon name="EyeOutlined" />
                </template>
              </a-statistic>
            </a-col>
            <a-col :span="8" class="text-center">
              <a-statistic title="Fork" :value="234">
                <template #suffix>
                  <AppIcon name="BranchesOutlined" />
                </template>
              </a-statistic>
            </a-col>
          </a-row>
        </a-col>
      </a-row>
    </a-card>

    <a-row :gutter="[16, 16]">
      <a-col :span="24">
        <a-card>
          <a-row>
            <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
              <a-card-grid style="width: 100%; text-align: 'center'">
                <a-statistic-countdown title="Countdown" :value="state.deadline" @finish="onFinish()" style="margin-right: 50px" />
              </a-card-grid>
            </a-col>
            <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
              <a-card-grid style="width: 100%; text-align: 'center'">
                <a-statistic-countdown title="Million Seconds" :value="state.deadline" format="HH:mm:ss:SSS" style="margin-right: 50px" />
              </a-card-grid>
            </a-col>
            <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
              <a-card-grid style="width: 100%; text-align: 'center'">
                <a-statistic-countdown title="Day Level" :value="state.deadline" format="D 天 H 时 m 分 s 秒" />
              </a-card-grid>
            </a-col>
            <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
              <a-card-grid style="width: 100%; text-align: 'center'">
                <a-statistic title="Feedback" :value="11.28" :precision="2" suffix="%" :valueStyle="{ color: '#3f8600' }" style="margin-right: 50px">
                  <template #prefix>
                    <AppIcon name="ArrowUpOutlined" />
                  </template>
                </a-statistic>
              </a-card-grid>
            </a-col>
          </a-row>
        </a-card>
      </a-col>
    </a-row>

    <a-row :gutter="[16, 16]" class="mt-16">
      <a-col :span="24">
        <a-card hoverable>
          <a-row :gutter="16" class="mt-16">
            <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
              <a-progress type="circle" :percent="75" :format="(percent:any) => `${percent} Days`" class="mr-16" />
              <a-progress type="circle" :percent="100" :format="() => 'Done'" class="mr-16" />
              <a-progress type="circle" :percent="75" class="mr-16">
                <template #format="percent">
                  <span style="color: red">{{ percent }}</span>
                </template>
              </a-progress>
            </a-col>
            <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
              <a-progress :percent="30" />
              <a-progress :percent="50" status="active" />
              <a-progress :percent="70" status="exception" />
              <a-progress :percent="100" />
              <a-progress :percent="50" :showInfo="false" />
            </a-col>
          </a-row>
        </a-card>
      </a-col>
    </a-row>

    <a-row :gutter="[16, 16]" class="mt-16">
      <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
        <a-card hoverable>
          <a-timeline mode="alternate">
            <a-timeline-item>Create a services site 2015-09-01</a-timeline-item>
            <a-timeline-item color="green">Solve initial network problems 2015-09-01</a-timeline-item>
            <a-timeline-item>
              <template #dot>
                <AppIcon name="ClockCircleOutlined" style="font-size: 16px" />
              </template>
              Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto
              beatae vitae dicta sunt explicabo.
            </a-timeline-item>
            <a-timeline-item color="red">Network problems being solved 2015-09-01</a-timeline-item>
            <a-timeline-item>Create a services site 2015-09-01</a-timeline-item>
            <a-timeline-item>
              <template #dot>
                <AppIcon name="ClockCircleOutlined" style="font-size: 16px" />
              </template>
              Technical testing 2015-09-01
            </a-timeline-item>
          </a-timeline>
        </a-card>
      </a-col>
    </a-row>

    <a-row :gutter="[16, 16]" class="mt-16">
      <a-col :xs="24" :sm="8" :md="8" :lg="6" :xl="6" v-for="(item, index) in 8" :key="index">
        <a-card hoverable>
          <template #cover>
            <img alt="example" src="https://gw.alipayobjects.com/zos/rmsportal/JiqGstEfoWAOHiTxclqi.png" />
          </template>
          <template #actions>
            <AppIcon name="setting-outlined" key="setting" />
            <AppIcon name="edit-outlined" key="edit" />
            <AppIcon name="ellipsis-outlined" key="ellipsis" />
          </template>
          <a-card-meta title="Card title" description="This is the description">
            <template #avatar>
              <a-avatar src="https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png" />
            </template>
          </a-card-meta>
        </a-card>
      </a-col>
    </a-row>
  </div>
</template>
