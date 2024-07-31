<script lang="ts">
	import type { PageData } from '../$types';
	export let data: PageData;
	let { art } = data;
</script>

<div class="p-5">
	<div class="grid gap-3 grid-cols-3">
		{#each art as work, index}
			<div>
				<img src={work.images[0].url} alt={work.title || 'untitled artwork'} />
				<h1>{work.title}</h1>
			</div>
		{/each}
	</div>
</div>
