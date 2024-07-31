<script lang="ts">
	import type { PageData } from './$types';
	export let data: PageData;
</script>

<div class="p-4 flex">
	{#each data.series as series}
		<div class="bg-slate-500 flex-1 flex flex-row p-2">
			<h1 class="font-bold mr-2">{series.title}</h1>
			{#each series.works as work}
				<div class="flex flex-col mr-2">
					<a href={`/book/${work.id}`}>
						<img class="w-24" src={work.images[0].url} alt={work.title} />
						<h1>{work.title}</h1>
					</a>
				</div>
			{/each}
		</div>
	{/each}
</div>
